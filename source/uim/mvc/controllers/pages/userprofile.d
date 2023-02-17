module uim.mvc.controllers.pages.userprofile;

@safe:
import uim.mvc;

class DAPPUserProfilePageController : DPageController {
  mixin(ControllerThis!("APPUserProfilePageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
      .parameter("pageTitle", "Registrierung")
      .parameter("pageBreadcrumbs", `<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Registrierung</a></li>
</ol>`)
      .title("Registrierung");
  }
}
mixin(ControllerCalls!("APPUserProfilePageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPUserProfilePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPUserProfilePageController); 
}}