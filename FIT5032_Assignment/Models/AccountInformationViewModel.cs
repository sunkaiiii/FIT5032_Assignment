using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FIT5032_Assignment.Models
{
    public class AccountInformationViewModel
    {
        public IEnumerable<CourseWishList> WhishList { get; set; }
        public IEnumerable<UserSkills> UserSkills { get; set; }
        public AccountInformationViewModel(IEnumerable<CourseWishList> whishList, IEnumerable<UserSkills> userSkills)
        {
            this.WhishList = whishList;
            this.UserSkills = userSkills;
        }
    }
}