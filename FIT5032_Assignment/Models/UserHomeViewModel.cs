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
        public IDictionary<TrainingCourse,bool> WishListStatus { get; }

        public UserHomeViewModel(IEnumerable<TrainingCourse> courses, IEnumerable<TrainingCourseTimetable> timetables, IDictionary<TrainingCourse, bool> wishListStatus)
        {
            this.TrainingCourses = courses;
            this.TrainingCourseTimetables = timetables;
            this.WishListStatus = wishListStatus;
        }
    }
}