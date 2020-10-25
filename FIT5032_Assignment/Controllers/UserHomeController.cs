using FIT5032_Assignment.Models;
using Microsoft.Ajax.Utilities;
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

        int page = 1;
        readonly int pageElement = 10;
        public ActionResult Index()
        {
            var trainingCourses = db.TrainingCourses
                .Where(course => !course.IsOver && db.CourseBookings.FirstOrDefault(booking=>booking.TrainingCourseId == course.Id && booking.AspNetUser.Email == User.Identity.Name) == null)
                .OrderByDescending(course => course.PublishDate)
                .Skip((page-1)*pageElement)
                .Take(pageElement).ToList();
            var timetable = db.CourseBookings
                .Include(booking => booking.AspNetUser)
                .Select(booking => booking.TrainingCourse)
                .Select(course => course.TrainingCourseTimetables.OrderByDescending(t=>t.CourseStartTime).FirstOrDefault())
                .ToList();
            return View(new UserHomeViewModel(trainingCourses,timetable));
        }

        public ActionResult NearByClasses()
        {
            var courses = db.TrainingCourses
                .Where(course => !course.IsOver)
                .OrderByDescending(course => course.PublishDate)
                .Skip((page - 1) * pageElement)
                .Take(pageElement).ToList()
                .Select(course=>new NearByCourseViewModel {LocationLongitude = course.LocationLongitude ?? 0,LocationLatitude = course.LocationLatitude ?? 0 });
            return View(courses);
        }

    }
}