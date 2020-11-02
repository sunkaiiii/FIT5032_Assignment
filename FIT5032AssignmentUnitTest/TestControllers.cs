using System;
using System.Web.Mvc;
using FIT5032_Assignment.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace FIT5032AssignmentUnitTest
{
    [TestClass]
    public class TestControllers
    {
        [TestMethod]
        public void TestUserHomeController()
        {
            UserHomeController controller = new UserHomeController();
            ViewResult result = controller.NearByClasses() as ViewResult;
            Assert.IsNotNull(result);
        }


        [TestMethod]
        public void TestTrendController()
        {
            TrendController controller = new TrendController();
            var result = controller.Index() as ViewResult;
            Assert.IsNotNull(result);
        }
    }
}
