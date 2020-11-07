using EllipticCurve;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class TimetableViewModel
    {
        public IEnumerable<TrainingCourseTimetable> Timetables { get; }
        public TrainingCourse CourseId { get; }

        public TimetableViewModel(IEnumerable<TrainingCourseTimetable> timetables, TrainingCourse courseId)
        {
            Timetables = timetables;
            CourseId = courseId;
        }

        public class AddTimetableModel
        {
            [Required]
            public DateTime CourseStartTime { get; set; }
            [Required]
            public DateTime CourseEndTime { get; set; }
            public bool IsLastOne { get; set; }
        }
    }
}