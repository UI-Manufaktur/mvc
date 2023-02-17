module uim.mvc.controllers.pages.lostpw;

@safe:
import uim.mvc;

class DAPPLostPasswordPageController : DPageController {
  mixin(ControllerThis!("APPLostPasswordPageController"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
    super.initialize;

    this
      .parameter("pageTitle", "Passwort vergessen?")
      .parameter("pageBreadcrumbs",`<ol class="breadcrumb" aria-label="breadcrumbs">
  <li class="breadcrumb-item"><a href="#">Start</a></li>
  <li class="breadcrumb-item active" aria-current="page"><a href="#">Passwort vergessen</a></li>
</ol>`)
      .title("Passwort vergessen")
      .view(APPLostPasswordView(this));
  }
}
mixin(PageControllerCalls!("APPLostPasswordPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPLostPasswordPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPLostPasswordPageController); 
}}