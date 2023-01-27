module uim.baklava.views.components.forms.components.contents.content;

@safe:
import uim.baklava;

class DBKLFormContent : DBKLFormComponent {
  mixin(BKLViewComponentThis!("BKLFormContent"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLFormContent~"::DBKLFormContent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(BKLViewComponentCalls!("BKLFormContent", "DBKLFormContent"));

version(test_baklava) { unittest {
  assert(BKLFormContent);
}}