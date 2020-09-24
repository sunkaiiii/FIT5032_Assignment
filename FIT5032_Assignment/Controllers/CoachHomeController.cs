using FIT5032_Assignment.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FIT5032_Assignment.Controllers
{
    [Authorize(Roles = "Coach")]
    public class CoachHomeController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();
        private readonly int pageElement = 20;
        // GET: CoachHome
        public ActionResult Index()
        {
            var timetables = db.TrainingCourses.Include(course => course.AspNetUser)
                .SelectMany(course => course.TrainingCourseTimetables)
                .OrderByDescending(timetable=>timetable.CourseStartTime)
                .Take(pageElement)
                .ToList();
            return View(new CoachHomeViewModel(timetables));
        }
    }
}