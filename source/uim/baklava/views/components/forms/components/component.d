module uim.baklava.views.components.forms.components.component;

@safe:
import uim.baklava;

class DBKLFormComponent : DBKLViewComponent {
  mixin(BKLViewComponentThis!("FormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLFormComponent~"::DBKLFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(BKLParameter!("title"));  
}
mixin(BKLViewComponentCalls!("BKLFormComponent", "DBKLFormComponent"));

version(test_uim_apps) { unittest {
  assert(BKLFormComponent);
}}