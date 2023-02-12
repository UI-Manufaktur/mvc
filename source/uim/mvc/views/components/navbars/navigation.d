module uim.mvc.views.components.navbars.navigation;

@safe:
import uim.mvc;

class DMVCNavigationViewComponent : DViewComponent {
  mixin(ViewComponentThis!("MVCNavigationViewComponent"));

  override void initialize(DConfigurationValue configSettings = null) {
    debugMethodCall(moduleName!DMVCNavigationViewComponent~"::DMVCNavigationViewComponent("~this.name~"):initialize");   
    super.initialize(configSettings);

    debug writeln("Add First Nav");
    this
      .firstNavbar(MVCFirstNavbar);

    debug writeln("Add Second Nav");
    this
      .secondNavbar(MVCSecondNavbar);
  }

  mixin(OProperty!("DViewComponent", "firstNavbar"));
  mixin(OProperty!("DViewComponent", "secondNavbar"));
  mixin(OProperty!("bool", "fixedTop"));
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    super.toH5(options);
    if (hasError) { return null; }

    debug writeln(moduleName!DMVCNavigationViewComponent~":DMVCNavigationViewComponent::toH5");
    auto rootPath = options.get("rootPath", "/");
    debug writeln(moduleName!DMVCNavigationViewComponent~":DMVCNavigationViewComponent::toH5 -> appSessionId = ", options.get("appSessionId", ""));

    auto firstNavbarH5 = this.firstNavbar   ? this.firstNavbar.toH5(options) 
                                            : null;
    debug writeln(firstNavbar ? "Has firstNavbar" : "Missing firstNavbar");
    debug writeln("firstNavbar -> ", firstNavbarH5);
    auto secNavbar = cast(DMVCSecondNavbar)this.secondNavbar;
    debug writeln(secondNavbar ? "Has secondNavbar" : "Missing secondNavbar");
    auto secondNavbarH5 = secNavbar ? secNavbar.brand(["link":rootPath, "title":options.get("appTitle", "")]).toH5(options) 
                                          : null;
    debug writeln("secondNavbar -> ", secNavbar);

    debug writeln("return navigation...");

    if (fixedTop) return [H5Div(["sticky-top"], firstNavbarH5~secondNavbarH5)].toH5;
    return firstNavbarH5~secondNavbarH5;
  }
}
mixin(ViewComponentCalls!("MVCNavigationViewComponent", "DMVCNavigationViewComponent"));
mixin(ViewComponentCalls!("MVCNavigation", "DMVCNavigationViewComponent"));
