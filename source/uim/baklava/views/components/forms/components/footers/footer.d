module uim.baklava.views.components.forms.components.footers.footer;

@safe:
import uim.baklava;

class DBLVFormFooter : DBLVFormComponent {
  mixin(BLVViewComponentThis!("BLVFormFooter"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVFormFooter~"::DBLVFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(BLVViewComponentCalls!("BLVFormFooter", "DBLVFormFooter"));

version(test_uim_apps) { unittest {
  assert(BLVFormFooter);
}}