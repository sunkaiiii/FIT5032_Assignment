using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class NearByCourseViewModel
    {
        public int CourseId { get; set; }
        public string CourseName { get; set; }
        public double LocationLatitude { get; set; }
        public double LocationLongitude { get; set; }
    }
}