module uim.baklava.controllers.pages.page;

@safe:
import uim.baklava;

class DBKLPageController : DBKLController {
  mixin(BKLControllerThis!("BKLPageController"));

  override void initialize() {
    super.initialize;

    this
      .language("en") 
      .mimetype("text/html");
    
/*     requestReader = BKLRequestReader(this);
    sessionReader = BKLSessionReader(this);  
 */
    this
      .links(BKLLinkContainer)
      .metas(BKLMetaContainer) 
      .scripts(BKLScriptContainer) 
      .styles(BKLStyleContainer); 
  }

  mixin(OProperty!("DBKLView", "view"));

  // Containers
  mixin(OProperty!("DBKLLinkContainer", "links"));
  mixin(OProperty!("DBKLMetaContainer", "metas"));
  mixin(OProperty!("DBKLScriptContainer", "scripts"));
  mixin(OProperty!("DBKLStyleContainer", "styles"));

  mixin(OProperty!("DBKLLayout", "layout"));

  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLPageController~":DBKLPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
  }    

  override string stringResponse(string[string] options = null) {
    debugMethodCall(moduleName!DBKLController~":DBKLController::stringResponse");
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
    debugMethodCall(moduleName!DBKLPageController~":DBKLPageController::afterResponse");
    super.afterResponse(options);
  }  
}
mixin(BKLControllerCalls!("BKLPageController", "DBKLPageController"));
