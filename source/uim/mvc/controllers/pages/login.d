module uim.mvc.controllers.pages.login;

@safe:
import uim.mvc;

class DLoginPageController : DPageController {
  mixin(ControllerThis!("LoginPageController"));

override void initialize(DConfigurationValue configSettings = null) {
    debugMethodCall(moduleName!DLoginPageController~"::DLoginPageController("~this.name~"):initialize");   
    super.initialize(configSettings);

    this
    .title("Anmeldung (Kennung)")
/*     .scripts(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`) */
    .parameter("pageTitle", "Anmeldung")
    .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Anmeldung (Kennung)</a></li>
</ol>`)
      .title("Anmeldung (Kennung)")
      .view(LoginView(this))
      .scripts.addLinks(
        "/js/apps/app.js",   
        "/js/apps/login.js");   
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DLoginPageController~":DLoginPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln("MImeType: ", this.mimetype);
  }
}
mixin(ControllerCalls!("LoginPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DLoginPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(LoginPageController); 
}}