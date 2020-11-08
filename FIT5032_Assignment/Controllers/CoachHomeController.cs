using FIT5032_Assignment.Models;
using Microsoft.AspNet.Identity;
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
        // GET: CoachHome
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            var timetables = db.TrainingCourses.Where(course => course.AspNetUserId == userId)
                .SelectMany(course => course.TrainingCourseTimetables)
                .Where(timetable=>timetable.CourseStartTime > DateTime.Now)
                .OrderBy(timetable=> timetable.CourseStartTime)
                .ToList();
            return View(new CoachHomeViewModel(timetables));
        }
    }
}