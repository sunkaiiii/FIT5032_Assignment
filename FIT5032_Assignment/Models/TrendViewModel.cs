using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class TrendViewModel
    {
        public TrendBooking TrendBookingModel { get; }
        public TrendViewModel(TrendBooking booking)
        {
            this.TrendBookingModel = booking;
        }
        public class TrendBooking
        {
            public TrainingCourse Course { get; set; }
            public int Count { get; set; }
        }
    }
}