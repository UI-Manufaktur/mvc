module uim.mvc.views.components.forms.components.footers.footer;

@safe:
import uim.mvc;

class DBKLFormFooter : DBKLFormComponent {
  mixin(BKLViewComponentThis!("BKLFormFooter"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLFormFooter~"::DBKLFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(BKLViewComponentCalls!("BKLFormFooter", "DBKLFormFooter"));

version(test_baklava) { unittest {
  assert(BKLFormFooter);
}}