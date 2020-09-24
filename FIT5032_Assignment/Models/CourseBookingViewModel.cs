using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class CourseBookingViewModel
    {
        public IEnumerable<CourseBooking> Bookings { get; }

        public CourseBookingViewModel(IEnumerable<CourseBooking> bookings)
        {
            this.Bookings = bookings;
        }
    }
}