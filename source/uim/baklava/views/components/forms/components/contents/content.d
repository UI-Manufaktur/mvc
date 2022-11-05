module uim.baklava.views.components.forms.components.contents.content;

@safe:
import uim.baklava;

class DBLVFormContent : DBLVFormComponent {
  mixin(BLVViewComponentThis!("BLVFormContent"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVFormContent~"::DBLVFormContent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(BLVViewComponentCalls!("BLVFormContent", "DBLVFormContent"));

version(test_uim_apps) { unittest {
  assert(BLVFormContent);
}}