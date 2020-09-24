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

namespace FIT5032_Assignment.Controllers
{
    public class TrainingCourseTimetablesController : Controller
    {
        private FIT5032_Assignment_ModelContainer db = new FIT5032_Assignment_ModelContainer();

        // GET: TrainingCourseTimetables
        public ActionResult Index()
        {
            var trainingCourseTimetables = db.TrainingCourseTimetables.Include(t => t.CourseId);
            return View(trainingCourseTimetables.ToList());
        }

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
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var timetable = db.TrainingCourseTimetables.Where(t => t.TrainingCourseId == id).ToList();
            return View(new TimetableViewModel(timetable));
        }

        // GET: TrainingCourseTimetables/Create
        public ActionResult Create()
        {
            ViewBag.TrainingCourseId = new SelectList(db.TrainingCourses, "Id", "CourseName");
            return View();
        }

        // POST: TrainingCourseTimetables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CourseStartTime,CourseEndTime,TrainingCourseId,IsLastOne")] TrainingCourseTimetable trainingCourseTimetable)
        {
            if (ModelState.IsValid)
            {
                db.TrainingCourseTimetables.Add(trainingCourseTimetable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TrainingCourseId = new SelectList(db.TrainingCourses, "Id", "CourseName", trainingCourseTimetable.TrainingCourseId);
            return View(trainingCourseTimetable);
        }

        // GET: TrainingCourseTimetables/Edit/5
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
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CourseStartTime,CourseEndTime,TrainingCourseId,IsLastOne")] TrainingCourseTimetable trainingCourseTimetable)
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
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TrainingCourseTimetable trainingCourseTimetable = db.TrainingCourseTimetables.Find(id);
            db.TrainingCourseTimetables.Remove(trainingCourseTimetable);
            db.SaveChanges();
            return RedirectToAction("Index");
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
