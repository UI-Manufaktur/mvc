module uim.mvc.controllers.pages.sites;

@safe:
import uim.mvc;

class DAPPSitesPage : DPageController {
  mixin(ControllerThis!("APPSitesPage"));

override void initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);

    this
    .title("Anmeldung (Kennung)")
    .view(ViewSites(this));

    this.scripts.addLinks(
      "/js/apps/app.js",   
      "/js/apps/login.js");

    this.scripts.addContents(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`);
    }
  }
mixin(ControllerCalls!("APPSitesPage"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPSitesPage); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPSitesPage); 
}}