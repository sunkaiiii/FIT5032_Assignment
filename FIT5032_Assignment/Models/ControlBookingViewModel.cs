using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class ControlBookingViewModel
    {
        public TrainingCourse TrainingCourse { get; set; }
        public IEnumerable<CourseBooking> Bookings { get; set; }
    }
}