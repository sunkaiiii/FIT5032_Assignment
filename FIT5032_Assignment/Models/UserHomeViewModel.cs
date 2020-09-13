using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class UserHomeViewModel
    {
        public IEnumerable<TrainingCourse> TrainingCourses { get; }
        public IEnumerable<TrainingCourseTimetable> TrainingCourseTimetables { get; }

        public UserHomeViewModel(IEnumerable<TrainingCourse> courses, IEnumerable<TrainingCourseTimetable> timetables)
        {
            this.TrainingCourses = courses;
            this.TrainingCourseTimetables = timetables;
        }
    }
}