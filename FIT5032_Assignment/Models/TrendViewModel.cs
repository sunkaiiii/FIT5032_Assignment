using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class TrendViewModel
    {
        public IEnumerable<TrendBooking> MostPopular { get; }
        public IEnumerable<TrainingCourse> TopRatingCourse { get; }
        public TrendViewModel(IEnumerable<TrendBooking> mostPopular, IEnumerable<TrainingCourse> courses)
        {
            this.MostPopular = mostPopular;
            this.TopRatingCourse = courses;
        }
        public class TrendBooking
        {
            public string CourseName { get; set; }
            public int CourseId { get; set; }
            public int Count { get; set; }
        }

    }
}