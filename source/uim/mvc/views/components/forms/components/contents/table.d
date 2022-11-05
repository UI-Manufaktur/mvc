module uim.mvc.views.components.forms.components.contents.table;

@safe:
import uim.mvc;

class DMVCTableFormContent : DMVCEntitiesViewComponent {
  mixin(MVCViewComponentThis!("MVCTableFormContent"));

  mixin(OProperty!("DMVCViewComponent", "row"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCTableFormContent~"::DMVCTableFormContent("~this.name~"):initialize");   
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCTableFormContent", "DMVCTableFormContent"));

version(test_uim_apps) { unittest {
  assert(MVCTableFormContent);
}}