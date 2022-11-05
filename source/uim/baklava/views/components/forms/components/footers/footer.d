module uim.baklava.views.components.forms.components.footers.footer;

@safe:
import uim.baklava;

class DMVCFormFooter : DMVCFormComponent {
  mixin(MVCViewComponentThis!("MVCFormFooter"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCFormFooter~"::DMVCFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(MVCViewComponentCalls!("MVCFormFooter", "DMVCFormFooter"));

version(test_uim_apps) { unittest {
  assert(MVCFormFooter);
}}