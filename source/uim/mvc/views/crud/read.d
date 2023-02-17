module uim.mvc.views.crud.read;

@safe:
import uim.mvc;

class DAPPEntityReadView : DEntityCRUDView { // Default view
  mixin(ViewThis!("APPEntityReadView"));
}
mixin(ViewCalls!("APPEntityReadView"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(new DAPPEntityReadView); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testView(APPEntityReadView); 
}}