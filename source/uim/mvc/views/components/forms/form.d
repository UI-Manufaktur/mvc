module uim.mvc.views.components.forms.form;

@safe:
import uim.mvc;

class DForm : DMVCViewComponent {
  mixin(MVCViewComponentThis!("Form"));

  override void initialize() {
    debugMethodCall(moduleName!DForm~"::DForm("~this.name~"):initialize");   
    super.initialize;    
    writeln("In ", __MODULE__, "/", __LINE__);
 
    this
      .id(name~"_"~to!string(uniform(0, 100_000)))
      .header(MVCFormHeader)
      .content(MVCEntityFormContent)
      .crudMode(CRUDModes.Read)
      .method("post");
  
  }

  mixin(OProperty!("string[string]", "defaults"));
  mixin(OProperty!("string[]", "fields"));
  // mixin(OProperty!("DMVCPanes", "panes"));
  mixin(MVCParameter!("action"));

  mixin(MVCParameter!("method"));
  mixin(OProperty!("bool", "readonly"));

  mixin(OProperty!("CRUDModes", "crudMode"));

  mixin(MVCParameter!("entityName"));
  mixin(MVCParameter!("entitiesName"));
  mixin(MVCParameter!("headerTitle"));
  mixin(MVCParameter!("contentTitle"));
  mixin(MVCParameter!("footerTitle"));

  mixin(OProperty!("DMVCFormHeader", "header"));
  mixin(OProperty!("DMVCFormContent", "content"));
  mixin(OProperty!("DMVCFormFooter", "footer"));

/*   DETBBase _database; 
  O database(this O)(DETBBase aDatabase) { 
    _database = aDatabase; 
    return cast(O)this; }

  DETBBase database() {
    if (_database) { return _database; } // has his own database
    if (this.view && this.view.database) { return this.view.database; } // owner class has database
    return null; // no database found
  } */

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    foreach(comp; [this.header, this.content, this.footer]) {
      comp
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(headerTitle);
    }
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DForm~":DForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form(this.id, ["card"], ["method":method, "action":action], 
        this.header.toH5(options)~
        this.content.toH5(options)~
        this.footer.toH5(options)
      ));
    
    return [_col].toH5;
  }  
}
mixin(MVCViewComponentCalls!("MVCForm", "DMVCForm"));

version(test_uim_apps) { unittest {
  assert(MVCForm);

  assert(MVCForm.entityName("Test").entityName == "Test");
  assert(MVCForm.entitiesName("Test").entitiesName == "Test");
  assert(MVCForm.headerTitle("Test").headerTitle == "Test");
  assert(MVCForm.contentTitle("Test").contentTitle == "Test");
  assert(MVCForm.footerTitle("Test").footerTitle == "Test");
}}