using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class CourseViewModel
    {
        [Required]
        public string CourseName { get; set; }

        [Required]
        [Range(0,int.MaxValue, ErrorMessage = "Course Capacity cannot lower than 0")]
        public int CourseCapacity { get; set; }

        public string CourseHeldLocation { get; set; } = "";

        [Range(-90,90, ErrorMessage = "Latitude is out of range")]
        public double? LocationLatitude { get; set; }

        [Range(-180,180, ErrorMessage = "Longitude is out of range")]
        public double? LocationLongitude { get; set; }

        [System.Web.Mvc.AllowHtml]
        public string CourseDescribtion { get; set; }
    }
}