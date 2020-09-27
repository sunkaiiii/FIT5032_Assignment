using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class RatingViewModel
    {
        public int BookingId { get; set; }
        public string BookingName { get; set; }
        public short RatingScore { get; set; }
        public string Feedback { get; set; }
    }
}