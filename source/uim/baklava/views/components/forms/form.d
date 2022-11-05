module uim.baklava.views.components.forms.form;

@safe:
import uim.baklava;

class DForm : DBLVViewComponent {
  mixin(BLVViewComponentThis!("Form"));

  override void initialize() {
    debugMethodCall(moduleName!DForm~"::DForm("~this.name~"):initialize");   
    super.initialize;    
    writeln("In ", __MODULE__, "/", __LINE__);
 
    this
      .id(name~"_"~to!string(uniform(0, 100_000)))
      .header(BLVFormHeader)
      .content(BLVEntityFormContent)
      .crudMode(CRUDModes.Read)
      .method("post");
  
  }

  mixin(OProperty!("string[string]", "defaults"));
  mixin(OProperty!("string[]", "fields"));
  // mixin(OProperty!("DBLVPanes", "panes"));
  mixin(BLVParameter!("action"));

  mixin(BLVParameter!("method"));
  mixin(OProperty!("bool", "readonly"));

  mixin(OProperty!("CRUDModes", "crudMode"));

  mixin(BLVParameter!("entityName"));
  mixin(BLVParameter!("entitiesName"));
  mixin(BLVParameter!("headerTitle"));
  mixin(BLVParameter!("contentTitle"));
  mixin(BLVParameter!("footerTitle"));

  mixin(OProperty!("DBLVFormHeader", "header"));
  mixin(OProperty!("DBLVFormContent", "content"));
  mixin(OProperty!("DBLVFormFooter", "footer"));

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
mixin(BLVViewComponentCalls!("BLVForm", "DBLVForm"));

version(test_uim_apps) { unittest {
  assert(BLVForm);

  assert(BLVForm.entityName("Test").entityName == "Test");
  assert(BLVForm.entitiesName("Test").entitiesName == "Test");
  assert(BLVForm.headerTitle("Test").headerTitle == "Test");
  assert(BLVForm.contentTitle("Test").contentTitle == "Test");
  assert(BLVForm.footerTitle("Test").footerTitle == "Test");
}}