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
    public class UserHomeController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();
        // GET: UserHome

        int page = 1;
        readonly int pageElement = 10;
        public ActionResult Index()
        {
            var trainingCourses = db.TrainingCourses
                .Where(course => !course.IsOver)
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

    }
}