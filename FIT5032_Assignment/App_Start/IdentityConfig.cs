using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using FIT5032_Assignment.Models;
using SendGrid.Helpers.Mail;
using System.Configuration;
using SendGrid;

namespace FIT5032_Assignment
{
    public class EmailService : IIdentityMessageService
    {
        public async Task SendAsync(IdentityMessage message)
        {
            await configSendGridasync(message);
        }

        public async Task SendCoachNotificationEmail(IdentityMessage message, string from, string fromName,List<EmailAddress> tos, HttpPostedFileBase postFile)
        {
            var myMessage = new SendGridMessage();
            //myMessage.From = new EmailAddress(from, fromName);
            myMessage.From = new EmailAddress("ksun0017@qq.com", "Administrator");
            myMessage.Subject = message.Subject;
            myMessage.PlainTextContent = message.Body;
            myMessage.HtmlContent = $@"
            Hi
            <br/>
            {message.Body} <br/>
             <br/>
             <br/>
            Best Regards, <br/>
            Vibrant your body <br/>
            55 King Rd Autumn, VIC,9999 <br/>
            012345678<br/>
            <img src=http://cdn.mcauto-images-production.sendgrid.net/7d8250131a038040/684a1fec-03be-4dd8-b957-446d7e2cf5c6/569x320.jpg  width='200'>";

            myMessage.AddTos(tos);
            if (postFile != null)
            {
                await myMessage.AddAttachmentAsync(postFile.FileName, postFile.InputStream);
            }
            var apiKey = ConfigurationManager.AppSettings["SendGridApi"];
            //var apiKey = "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";
            var client = new SendGridClient(apiKey);
            var response = await client.SendEmailAsync(myMessage);
            Console.WriteLine(response.Body);
        }

        private async Task configSendGridasync(IdentityMessage message)
        {
            var myMessage = new SendGridMessage();
            myMessage.AddTo(message.Destination);
            myMessage.From = new EmailAddress("ksun0017@qq.com", "Kai Sun");
            myMessage.Subject = message.Subject;
            myMessage.PlainTextContent = message.Body;
            myMessage.HtmlContent = $@"
            Hi
            <br/>
            {message.Body} <br/>
             <br/>
             <br/>
            Best Regards, <br/>
            Vibrant your body <br/>
            55 King Rd Autumn, VIC,9999 <br/>
            012345678<br/>
<img src=http://cdn.mcauto-images-production.sendgrid.net/7d8250131a038040/684a1fec-03be-4dd8-b957-446d7e2cf5c6/569x320.jpg  width='200'>";
            var apiKey = ConfigurationManager.AppSettings["SendGridApi"];
            var client = new SendGridClient(apiKey);
            var response = await client.SendEmailAsync(myMessage);
            Console.WriteLine(response.Body);
        }
    }


    public class SmsService : IIdentityMessageService
    {
        public Task SendAsync(IdentityMessage message)
        {
            // Plug in your SMS service here to send a text message.
            return Task.FromResult(0);
        }
    }

    // Configure the application user manager used in this application. UserManager is defined in ASP.NET Identity and is used by the application.
    public class ApplicationUserManager : UserManager<ApplicationUser>
    {
        public ApplicationUserManager(IUserStore<ApplicationUser> store)
            : base(store)
        {
        }

        public static ApplicationUserManager Create(IdentityFactoryOptions<ApplicationUserManager> options, IOwinContext context) 
        {
            var manager = new ApplicationUserManager(new UserStore<ApplicationUser>(context.Get<ApplicationDbContext>()));
            // Configure validation logic for usernames
            manager.UserValidator = new UserValidator<ApplicationUser>(manager)
            {
                AllowOnlyAlphanumericUserNames = false,
                RequireUniqueEmail = true
            };

            // Configure validation logic for passwords
            manager.PasswordValidator = new PasswordValidator
            {
                RequiredLength = 6,
                RequireDigit = true,
            };

            // Configure user lockout defaults
            manager.UserLockoutEnabledByDefault = true;
            manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(5);
            manager.MaxFailedAccessAttemptsBeforeLockout = 5;

            // Register two factor authentication providers. This application uses Phone and Emails as a step of receiving a code for verifying the user
            // You can write your own provider and plug it in here.
            manager.RegisterTwoFactorProvider("Phone Code", new PhoneNumberTokenProvider<ApplicationUser>
            {
                MessageFormat = "Your security code is {0}"
            });
            manager.RegisterTwoFactorProvider("Email Code", new EmailTokenProvider<ApplicationUser>
            {
                Subject = "Security Code",
                BodyFormat = "Your security code is {0}"
            });
            manager.EmailService = new EmailService();
            manager.SmsService = new SmsService();
            var dataProtectionProvider = options.DataProtectionProvider;
            if (dataProtectionProvider != null)
            {
                manager.UserTokenProvider = 
                    new DataProtectorTokenProvider<ApplicationUser>(dataProtectionProvider.Create("ASP.NET Identity"));
            }
            return manager;
        }
    }

    // Configure the application sign-in manager which is used in this application.
    public class ApplicationSignInManager : SignInManager<ApplicationUser, string>
    {
        public ApplicationSignInManager(ApplicationUserManager userManager, IAuthenticationManager authenticationManager)
            : base(userManager, authenticationManager)
        {
        }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(ApplicationUser user)
        {
            return user.GenerateUserIdentityAsync((ApplicationUserManager)UserManager);
        }

        public static ApplicationSignInManager Create(IdentityFactoryOptions<ApplicationSignInManager> options, IOwinContext context)
        {
            return new ApplicationSignInManager(context.GetUserManager<ApplicationUserManager>(), context.Authentication);
        }
    }

    public class ApplicationRoleManager:RoleManager<IdentityRole>
    {
        public ApplicationRoleManager(IRoleStore<IdentityRole, string> roleStore) : base(roleStore)
        { }

        public static ApplicationRoleManager Create(IdentityFactoryOptions<ApplicationRoleManager> options, IOwinContext context)
        {
            var appRoleManager = new ApplicationRoleManager(new RoleStore<IdentityRole>(context.Get<ApplicationDbContext>()));
            return appRoleManager;
        }
    }
}
