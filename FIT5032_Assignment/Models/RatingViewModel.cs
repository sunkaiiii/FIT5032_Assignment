using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class RatingViewModel
    {
        [Required]
        public int BookingId { get; set; }
        [Required]
        public string BookingName { get; set; }
        [Range(0,10,ErrorMessage = "Enter rating score between 0 to 1000")]
        [Required]
        public short RatingScore { get; set; }
        public string Feedback { get; set; }
    }
}