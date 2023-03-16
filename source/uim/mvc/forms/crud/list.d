/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.crud.list;

@safe:
import uim.mvc;

class DEntitiesListForm : DMVCEntitiesForm {
  mixin(ViewComponentThis!("EntitiesListForm"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .header(
        FormHeader //.mainTitle("Blogs").subTitle("Übersicht Blogs").actions([["print", "export"]])
      )
      .content(
        MVCEntitiesFormContent      
      );
    /*       .form
        .header(MVCEntitiesheader(this.form).rootPath("/cms/blogs").mainTitle("Blogs").subTitle("Blogs anzeigen").actions([["print", "export"]]))
        .body_(MVCListbody_(this.form).rootPath("/cms/blogs"));
 */
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesListForm~":DEntitiesListForm("~this.name~")::toH5");
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
mixin(ViewComponentCalls!("EntitiesListForm", "DEntitiesListForm"));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    assert(new DEntitiesListForm);
    assert(EntitiesListForm);
  }
}
