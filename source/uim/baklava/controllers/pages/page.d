module uim.baklava.controllers.pages.page;

@safe:
import uim.baklava;

class DBLVPageController : DBLVController {
  mixin(BLVControllerThis!("BLVPageController"));

  override void initialize() {
    super.initialize;

    this
      .language("en") 
      .mimetype("text/html");
    
/*     requestReader = BLVRequestReader(this);
    sessionReader = BLVSessionReader(this);  
 */
    this
      .links(BLVLinkContainer)
      .metas(BLVMetaContainer) 
      .scripts(BLVScriptContainer) 
      .styles(BLVStyleContainer); 
  }

  mixin(OProperty!("DBLVView", "view"));

  // Containers
  mixin(OProperty!("DBLVLinkContainer", "links"));
  mixin(OProperty!("DBLVMetaContainer", "metas"));
  mixin(OProperty!("DBLVScriptContainer", "scripts"));
  mixin(OProperty!("DBLVStyleContainer", "styles"));

  mixin(OProperty!("DBLVLayout", "layout"));

  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DBLVPageController~":DBLVPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }    

  override string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DBLVController~":DBLVController::stringResponse");
    super.stringResponse(options);

    string result;
    if (view) result = view.render(options);
    if (auto myLayout = this.layout) {
      result = myLayout.render(this, result);  
    }
    else {
      result = this.application && this.application.layout ? this.application.layout.render(this, result) : result;  
    }

    return result;
  }

  override void afterResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DBLVPageController~":DBLVPageController::afterResponse");
    super.afterResponse(options);
  }  
}
mixin(BLVControllerCalls!("BLVPageController", "DBLVPageController"));
