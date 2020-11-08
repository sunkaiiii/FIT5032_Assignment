using FIT5032_Assignment.Models;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FIT5032_Assignment.Controllers
{
    [Authorize(Roles = "User")]
    public class UserHomeController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();
        // GET: UserHome

        public ActionResult Index(int? wishStatus)
        {
            var id = User.Identity.GetUserId();
            var trainingCourses = db.TrainingCourses
                .Where(course => !course.IsOver && db.CourseBookings.FirstOrDefault(booking => booking.TrainingCourseId == course.Id && booking.AspNetUser.Email == User.Identity.Name) == null)
                .OrderByDescending(course => course.PublishDate).ToList();
            var timetable = db.CourseBookings
                .Where(booking => booking.AspNetUserId == id)
                .Select(booking => booking.TrainingCourse)
                .Select(course => course.TrainingCourseTimetables.OrderByDescending(t => t.CourseStartTime).FirstOrDefault())
                .Where(t => t != null && t.CourseStartTime > DateTime.Now)
                .ToList();
            var wishListStatus = new Dictionary<TrainingCourse, bool>();
            trainingCourses.ForEach(course =>
            {
                var wishList = db.CourseWishLists.FirstOrDefault(wish => wish.TrainingCourseId == course.Id && wish.AspNetUserId == id);
                wishListStatus[course] = wishList != null;
            });
            if(wishStatus!=null)
            {
                ViewBag.WishStatus = wishStatus;
            }
            else
            {
                ViewBag.WishStatus = 0;
            }
            
            return View(new UserHomeViewModel(trainingCourses, timetable, wishListStatus));
        }

        public ActionResult NearByClasses()
        {
            var courses = db.TrainingCourses
                .Where(course => !course.IsOver)
                .OrderByDescending(course => course.PublishDate).ToList()
                .Select(course => new NearByCourseViewModel { LocationLongitude = course.LocationLongitude ?? 0, LocationLatitude = course.LocationLatitude ?? 0, CourseId = course.Id, CourseName = course.CourseName }).ToList();
            return View(courses);
        }

        public ActionResult AccountInformation()
        {
            var userId = User.Identity.GetUserId();
            var userSkills = db.UserSkills.Where(skill => skill.AspNetUserId == userId).ToList();
            var userWishList = db.CourseWishLists.Where(course => course.AspNetUserId == userId).ToList();
            return View(new AccountInformationViewModel(userWishList, userSkills));
        }

        public ActionResult DeleteWish(int? id)
        {
            var wishList = db.CourseWishLists.FirstOrDefault(wish => wish.Id == id);
            if (id == null || wishList == null)
            {
                return HttpNotFound();
            }
            db.CourseWishLists.Remove(wishList);
            db.SaveChanges();
            return RedirectToAction(nameof(Index), new { wishStatus = 2 });
        }

        public ActionResult DeleteWishByCourseId(int? courseId)
        {
            var wishList = db.CourseWishLists.Where(wish => wish.TrainingCourseId == courseId);
            db.CourseWishLists.RemoveRange(wishList);
            db.SaveChanges();
            return RedirectToAction(nameof(Index), new { wishStatus = 2 });
        }

        public ActionResult AddWish(int? courseId)
        {
            var course = db.TrainingCourses.FirstOrDefault(c => c.Id == courseId);
            if (courseId == null || course == null)
            {
                return HttpNotFound();
            }
            CourseWishList wish = new CourseWishList();
            wish.InsertDate = DateTime.Now;
            wish.TrainingCourseId = course.Id;
            wish.AspNetUserId = User.Identity.GetUserId();
            db.CourseWishLists.Add(wish);
            db.SaveChanges();
            return RedirectToAction(nameof(Index),new { wishStatus = 1 });
        }
    }
}