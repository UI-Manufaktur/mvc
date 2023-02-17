module uim.mvc.controllers.pages.error;

@safe:
import uim.mvc;

class DAPPErrorPageController : DPageController {
  mixin(ControllerThis!("APPErrorPageController"));
}
mixin(PageControllerCalls!("APPErrorPageController"));

version(test_uim_apps) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPErrorPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPErrorPageController); 
}}