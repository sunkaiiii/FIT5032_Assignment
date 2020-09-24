using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class CoachHomeViewModel
    {
        public IEnumerable<TrainingCourseTimetable> Timetable { get; }

        public CoachHomeViewModel(IEnumerable<TrainingCourseTimetable> timetables)
        {
            this.Timetable = timetables;
        }
    }
}