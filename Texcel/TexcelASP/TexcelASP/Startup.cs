using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TexcelASP.Startup))]
namespace TexcelASP
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
