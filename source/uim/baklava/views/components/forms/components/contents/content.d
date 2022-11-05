module uim.baklava.views.components.forms.components.contents.content;

@safe:
import uim.baklava;

class DMVCFormContent : DMVCFormComponent {
  mixin(MVCViewComponentThis!("MVCFormContent"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCFormContent~"::DMVCFormContent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(MVCViewComponentCalls!("MVCFormContent", "DMVCFormContent"));

version(test_uim_apps) { unittest {
  assert(MVCFormContent);
}}