using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class CancelBookingModel
    {
        [Required]
        public CourseBooking Booking { get; set; }

        public string Comment { get; set; }
    }
}