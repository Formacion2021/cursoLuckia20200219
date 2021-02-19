using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(cursoLuckia20200219.Startup))]
namespace cursoLuckia20200219
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
