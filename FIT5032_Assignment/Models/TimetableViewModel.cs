using EllipticCurve;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class TimetableViewModel
    {
        public IEnumerable<TrainingCourseTimetable> Timetables { get; }

        public TimetableViewModel(IEnumerable<TrainingCourseTimetable> timetables)
        {
            Timetables = timetables;
        }
    }
}