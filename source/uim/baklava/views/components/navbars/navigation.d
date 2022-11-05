module uim.baklava.views.components.navbars.navigation;

@safe:
import uim.baklava;

class DBLVNavigationViewComponent : DBLVViewComponent {
  mixin(BLVViewComponentThis!("BLVNavigationViewComponent"));

  override void initialize() {
    debugMethodCall(moduleName!DBLVNavigationViewComponent~"::DBLVNavigationViewComponent("~this.name~"):initialize");   
    super.initialize;

    debug writeln("Add First Nav");
    this
      .firstNavbar(BLVFirstNavbar);

    debug writeln("Add Second Nav");
    this
      .secondNavbar(BLVSecondNavbar);
  }

  mixin(OProperty!("DBLVViewComponent", "firstNavbar"));
  mixin(OProperty!("DBLVViewComponent", "secondNavbar"));
  mixin(OProperty!("bool", "fixedTop"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    debug writeln(moduleName!DBLVNavigationViewComponent~":DBLVNavigationViewComponent::toH5");
    auto rootPath = options.get("rootPath", "/");
    debug writeln(moduleName!DBLVNavigationViewComponent~":DBLVNavigationViewComponent::toH5 -> appSessionId = ", options.get("appSessionId", ""));

    auto firstNavbarH5 = this.firstNavbar   ? this.firstNavbar.toH5(options) 
                                            : null;
    debug writeln(firstNavbar ? "Has firstNavbar" : "Missing firstNavbar");
    debug writeln("firstNavbar -> ", firstNavbarH5);
    auto secNavbar = cast(DBLVSecondNavbar)this.secondNavbar;
    debug writeln(secondNavbar ? "Has secondNavbar" : "Missing secondNavbar");
    auto secondNavbarH5 = secNavbar ? secNavbar.brand(["link":rootPath, "title":options.get("appTitle", "")]).toH5(options) 
                                          : null;
    debug writeln("secondNavbar -> ", secNavbar);

    debug writeln("return navigation...");

    if (fixedTop) return [H5Div(["sticky-top"], firstNavbarH5~secondNavbarH5)].toH5;
    return firstNavbarH5~secondNavbarH5;
  }
}
mixin(BLVViewComponentCalls!("BLVNavigationViewComponent", "DBLVNavigationViewComponent"));
mixin(BLVViewComponentCalls!("BLVNavigation", "DBLVNavigationViewComponent"));
