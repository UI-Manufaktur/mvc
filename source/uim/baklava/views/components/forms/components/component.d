module uim.baklava.views.components.forms.components.component;

@safe:
import uim.baklava;

class DBLVFormComponent : DBLVViewComponent {
  mixin(BLVViewComponentThis!("FormComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVFormComponent~"::DBLVFormComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }

  mixin(OProperty!("CRUDModes", "crudMode"));
  mixin(OProperty!("DForm", "form"));
  mixin(OProperty!("bool", "readonly")); 
  mixin(BLVParameter!("title"));  
}
mixin(BLVViewComponentCalls!("BLVFormComponent", "DBLVFormComponent"));

version(test_uim_apps) { unittest {
  assert(BLVFormComponent);
}}