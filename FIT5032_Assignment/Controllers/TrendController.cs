using FIT5032_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FIT5032_Assignment.Controllers
{
    [AllowAnonymous]
    public class TrendController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();
        private static readonly int TREND_PAGE_RESULT_LIMIT = 20;
        // GET: Trend
        public ActionResult Index()
        {
            var topHotCourse = db.CourseBookings
                .GroupBy(booking => booking.TrainingCourse, booking => booking, (key, b) => new { CourseId = key, BookingNum = b.Count() })
                .OrderByDescending(bookingGroup => bookingGroup.BookingNum)
                .Select(group => new TrendViewModel.TrendBooking { Course = group.CourseId, Count = group.BookingNum })
                .Take(TREND_PAGE_RESULT_LIMIT)
                .ToList();
            var topRateCourse = db
                .TrainingCourses.OrderByDescending(course => course.Rate)
                .Take(TREND_PAGE_RESULT_LIMIT)
                .ToList();
            return View();
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