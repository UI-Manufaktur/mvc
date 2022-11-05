module uim.baklava.views.components.forms.crud.list;

@safe:
import uim.baklava;

class DBKLEntitiesListForm : DBKLEntitiesForm {
  mixin(BKLViewComponentThis!("BKLEntitiesListForm"));

  override void initialize() {
    super.initialize;

    this
      .header(
        BKLFormHeader //.mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["print", "export"]])
      )
      .content(
        BKLEntitiesFormContent      
      );
    /*       .form
        .header(BKLEntitiesheader(this.form).rootPath("/cms/blogs").mainTitle("Blogs").subTitle("Blogs anzeigen").actions([["print", "export"]]))
        .body_(BKLListbody_(this.form).rootPath("/cms/blogs"));
 */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DBKLEntitiesListForm~":DBKLEntitiesListForm("~this.name~")::toH5");
    super.toH5(options);
    
    DBS5Col _col = BS5Col(["col-12"]);
    _col(
      H5Form("Form", ["card"], ["method":method, "action":action], 
        this.header.toH5(options)~
        this.content.toH5(options)~
        this.footer.toH5(options) 
      ));
    
    return [_col].toH5;
  }  
}
mixin(BKLViewComponentCalls!("BKLEntitiesListForm", "DBKLEntitiesListForm"));

version(test_baklava) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DBKLEntitiesListForm);
    assert(BKLEntitiesListForm);
  }
}
