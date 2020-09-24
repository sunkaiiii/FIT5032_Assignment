using FIT5032_Assignment.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
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
            var bookingList = db.CourseBookings.Where(booking => booking.AspNetUserId == userId).ToList();
            var viewModel = new CourseBookingViewModel(bookingList);
            return View(viewModel);
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
            var bookingModel = new CourseBooking();
            bookingModel.TrainingCourseId = id;
            bookingModel.AspNetUserId = userId;
            bookingModel.BookingTime = DateTime.Now;
            db.CourseBookings.Add(bookingModel);
            db.SaveChanges();
            Response.Write("<script>alert('adding successfully'); history.go(-1);</script>");
            return;
        }
    }
}