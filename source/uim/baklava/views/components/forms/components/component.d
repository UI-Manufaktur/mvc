module uim.baklava.views.components.forms.components.component;

@safe:
import uim.baklava;

class DMVCFormComponent : DMVCViewComponent {
  mixin(MVCViewComponentThis!("FormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCFormComponent~"::DMVCFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(MVCParameter!("title"));  
}
mixin(MVCViewComponentCalls!("MVCFormComponent", "DMVCFormComponent"));

version(test_uim_apps) { unittest {
  assert(MVCFormComponent);
}}