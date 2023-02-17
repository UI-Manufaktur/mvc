module uim.mvc.controllers.pages.error;

@safe:
import uim.mvc;

class DAPPErrorPageController : DPageController {
  mixin(ControllerThis!("APPErrorPageController"));
}
mixin(ControllerCalls!("APPErrorPageController"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DAPPErrorPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(APPErrorPageController); 
}}