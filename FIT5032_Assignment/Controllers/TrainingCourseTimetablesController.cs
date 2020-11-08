using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_Assignment.Models;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.Identity;

namespace FIT5032_Assignment.Controllers
{
    [Authorize(Roles = "User, Coach")]
    public class TrainingCourseTimetablesController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();


        // GET: TrainingCourseTimetables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TrainingCourseTimetable trainingCourseTimetable = db.TrainingCourseTimetables.Find(id);
            if (trainingCourseTimetable == null)
            {
                return HttpNotFound();
            }
            return View(trainingCourseTimetable);
        }

        public ActionResult FindByCourseId(int? id)
        {
            var course = db.TrainingCourses.FirstOrDefault(c => c.Id == id);
            if(id == null || course == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var timetable = db.TrainingCourseTimetables.Where(t => t.TrainingCourseId == id).ToList();
            return View(new TimetableViewModel(timetable, course));
        }

        // GET: TrainingCourseTimetables/Create
        [Authorize(Roles = "Coach")]
        public ActionResult Create(int? courseId)
        {
            var course = db.TrainingCourses.FirstOrDefault(c => c.Id == courseId);
            if(course == null)
            {
                return RedirectToAction("FindByCourseId", new { id = courseId });
            }
            ViewBag.courseId = courseId;
            return View();
        }

        // POST: TrainingCourseTimetables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Coach")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CourseStartTime,CourseEndTime,TrainingCourseId,IsLastOne")] int courseId, TimetableViewModel.AddTimetableModel newTimetable)
        {
            if (ModelState.IsValid && CheckTimeCollision(courseId, newTimetable))
            {
                TrainingCourseTimetable trainingCourseTimetable = new TrainingCourseTimetable();
                trainingCourseTimetable.CourseStartTime = newTimetable.CourseStartTime;
                trainingCourseTimetable.CourseEndTime = newTimetable.CourseEndTime;
                trainingCourseTimetable.TrainingCourseId = courseId;
                trainingCourseTimetable.IsLastOne = newTimetable.IsLastOne;
                db.TrainingCourseTimetables.Add(trainingCourseTimetable);
                db.SaveChanges();
                return RedirectToAction("FindByCourseId",new { id = courseId});
            }
            ViewBag.courseId = courseId;
            return View(newTimetable);
        }

        private bool CheckTimeCollision(int courseId, TimetableViewModel.AddTimetableModel newTimetable)
        {
            var userId = User.Identity.GetUserId();
            bool result = true;
            result &= newTimetable.CourseStartTime < newTimetable.CourseEndTime;
            result &= newTimetable.CourseStartTime > DateTime.Now;
            //check the timetable collision
            db.TrainingCourseTimetables
                .Where(timetable => timetable.TrainingCourseId == courseId)
                .ForEach(timetable=> {
                    if (timetable.CourseStartTime < newTimetable.CourseStartTime)
                    {
                        result &= timetable.CourseEndTime < newTimetable.CourseStartTime;
                    }
                    else
                    {
                        result &= timetable.CourseStartTime > newTimetable.CourseEndTime;
                    }
                } );
            if (!result)
            {
                ViewBag.TimeErrorMessage = "The chosen time duration has not mathched the constraints, please try again";
            }
            return result;
        }

        // GET: TrainingCourseTimetables/Edit/5
        [Authorize(Roles = "Coach")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TrainingCourseTimetable trainingCourseTimetable = db.TrainingCourseTimetables.Find(id);
            if (trainingCourseTimetable == null)
            {
                return HttpNotFound();
            }
            ViewBag.TrainingCourseId = new SelectList(db.TrainingCourses, "Id", "CourseName", trainingCourseTimetable.TrainingCourseId);
            return View(trainingCourseTimetable);
        }

        // POST: TrainingCourseTimetables/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Authorize(Roles = "Coach")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CourseStartTime,CourseEndTime,TrainingCourseId,IsLastOne")] TrainingCourseTimetable trainingCourseTimetable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(trainingCourseTimetable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TrainingCourseId = new SelectList(db.TrainingCourses, "Id", "CourseName", trainingCourseTimetable.TrainingCourseId);
            return View(trainingCourseTimetable);
        }

        // GET: TrainingCourseTimetables/Delete/5
        [Authorize(Roles = "Coach")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TrainingCourseTimetable trainingCourseTimetable = db.TrainingCourseTimetables.Find(id);
            if (trainingCourseTimetable == null)
            {
                return HttpNotFound();
            }
            return View(trainingCourseTimetable);
        }

        // POST: TrainingCourseTimetables/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Coach")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TrainingCourseTimetable trainingCourseTimetable = db.TrainingCourseTimetables.Find(id);
            int courseId = trainingCourseTimetable.TrainingCourseId;
            db.TrainingCourseTimetables.Remove(trainingCourseTimetable);
            db.SaveChanges();
            return RedirectToAction("FindByCourseId", new { id = courseId });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
