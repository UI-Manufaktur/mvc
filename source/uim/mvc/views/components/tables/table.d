/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tables.table;

@safe:
import uim.mvc;

class DMVCTableViewComponent : DMVCViewComponent {
  mixin(MVCViewComponentThis!("MVCTableViewComponent"));
  
  mixin(OProperty!("string", "path"));  
  mixin(OProperty!("DMVCViewComponent", "header"));
  mixin(OProperty!("DMVCViewComponent", "content"));
  mixin(OProperty!("DMVCViewComponent", "footer"));

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    if (hasError || "redirect" in options) { return null; } 

    return [
      H5Div(["table-responsive"], 
        BS5Table(["card-table table-vcenter text-nowrap datatable"], 
          this.header.toH5(options)~
          this.content.toH5(options)~
          this.footer.toH5(options)
        )        
      )].toH5;
  }
}
mixin(MVCViewComponentCalls!("MVCTableViewComponent", "DMVCTableViewComponent"));

version(test_baklava) { unittest {
  assert(MVCTableViewComponent);
}}

