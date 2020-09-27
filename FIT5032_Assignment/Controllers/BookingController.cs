using FIT5032_Assignment.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FIT5032_Assignment.Controllers
{
    [Authorize(Roles = "User")]
    public class BookingController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();

        // GET: Booking
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            var bookingList = db.CourseBookings.Where(booking => booking.AspNetUserId == userId && !booking.TrainingCourse.IsOver).ToList();
            var viewModel = new CourseBookingViewModel(bookingList);
            return View(viewModel);
        }

        public ActionResult FinishedBooking()
        {
            var userId = User.Identity.GetUserId();
            var bookingList = db.CourseBookings.Where(booking => booking.AspNetUserId == userId && booking.TrainingCourse.IsOver).ToList();
            return View(bookingList);
        }

        public void Booking(int id)
        {
            var userId = User.Identity.GetUserId();
            var booking = db.CourseBookings.FirstOrDefault(b => (b.TrainingCourseId == id && b.AspNetUserId == userId));
            if (booking != null)
            {
                Response.Write("<script>alert('you have already booked this course'); history.go(-1);</script>");
                return;
            }
            var coures = db.TrainingCourses.FirstOrDefault(c => c.Id == id);
            if(coures == null)
            {
                Response.Write("<script>alert('course id is invalid'); history.go(-1);</script>");
                return;
            }
            if(coures.IsOver)
            {
                Response.Write("<script>alert('The course is over, you cannot book this course.'); history.go(-1);</script>");
            }
            var bookingModel = new CourseBooking();
            bookingModel.TrainingCourseId = id;
            bookingModel.AspNetUserId = userId;
            bookingModel.BookingTime = DateTime.Now;
            db.CourseBookings.Add(bookingModel);
            db.SaveChanges();
            Response.Write("<script>alert('adding successfully'); window.location.href=document.referrer;</script>");
            return;
        }

        public ActionResult Rating(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var course = db.CourseBookings.Find(id);
            return View(new RatingViewModel { BookingId = course.Id, BookingName = course.TrainingCourse.CourseName});
        }

        [HttpPost]
        public void Rating(RatingViewModel ratingViewModel)
        {
            var oldBooking = db.CourseBookings.Find(ratingViewModel.BookingId);
            oldBooking.RatingScore = ratingViewModel.RatingScore;
            oldBooking.Feedback = ratingViewModel.Feedback;
            oldBooking.IsRated = true;
            if(ModelState.IsValid)
            {
                db.Entry(oldBooking).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges() ;
                Response.Write("<script>alert('adding successfully'); history.go(-1); location.reload();</script>");
                return;
            }
            return;
        }

        public ActionResult Delete (int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var booking = db.CourseBookings.Find(id);
            if(booking == null)
            {
                return HttpNotFound();
            }
            return View(booking);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult CancelConfirmed(int id)
        {
            var booking = db.CourseBookings.Find(id);
            db.CourseBookings.Remove(booking);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if(disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


    }
}