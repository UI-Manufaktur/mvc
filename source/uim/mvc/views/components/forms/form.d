module uim.baklava.views.components.forms.form;

@safe:
import uim.baklava;

class DBKLForm : DBKLViewComponent {
  mixin(BKLViewComponentThis!("BKLForm"));

  override void initialize() {
    debugMethodCall(moduleName!DBKLForm~"::DBKLForm("~this.name~"):initialize");   
    super.initialize;    
    writeln("In ", __MODULE__, "/", __LINE__);
 
    this
      .id(name~"_"~to!string(uniform(0, 100_000)))
      .header(BKLFormHeader)
      .content(BKLEntityFormContent)
      .crudMode(CRUDModes.Read)
      .method("post");
  
  }

  mixin(OProperty!("string[string]", "defaults"));
  mixin(OProperty!("string[]", "fields"));
  // mixin(OProperty!("DBKLPanes", "panes"));
  mixin(BKLParameter!("action"));

  mixin(BKLParameter!("method"));
  mixin(OProperty!("bool", "readonly"));
  mixin(OProperty!("string", "rootPath"));

  mixin(OProperty!("CRUDModes", "crudMode"));

  mixin(BKLParameter!("entityName"));
  mixin(BKLParameter!("entitiesName"));
  mixin(BKLParameter!("headerTitle"));
  mixin(BKLParameter!("contentTitle"));
  mixin(BKLParameter!("footerTitle"));

  mixin(OProperty!("DBKLFormHeader", "header"));
  mixin(OProperty!("DBKLFormContent", "content"));
  mixin(OProperty!("DBKLFormFooter", "footer"));

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
    debugMethodCall(moduleName!DBKLForm~":DBKLForm("~this.name~")::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

/*     foreach(comp; [this.header, this.content, this.footer]) {
      comp
        .crudMode(this.crudMode)
        .rootPath(this.rootPath)
        .title(headerTitle); 
    } */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLForm~":DBKLForm("~this.name~")::toH5");
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
mixin(BKLViewComponentCalls!("BKLForm", "DBKLForm"));

version(test_baklava) { unittest {
  assert(BKLForm);

  assert(BKLForm.entityName("Test").entityName == "Test");
  assert(BKLForm.entitiesName("Test").entitiesName == "Test");
  assert(BKLForm.headerTitle("Test").headerTitle == "Test");
  assert(BKLForm.contentTitle("Test").contentTitle == "Test");
  assert(BKLForm.footerTitle("Test").footerTitle == "Test");
}}