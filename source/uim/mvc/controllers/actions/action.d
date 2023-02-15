/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.actions.action;

@safe:
import uim.mvc;

class DActionController : DController, IActionController {
  mixin(ControllerThis!("ActionController"));

  mixin(OProperty!("DETBCollection", "collection"));
  mixin(OProperty!("DEntity", "site"));
  mixin(OProperty!("DETBTenant", "tenant"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DActionController~":DActionController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    this.session = getAppSession(options);
    if (session) { this.site(session.site); }
    
    this.tenant(ETBNullTenant).collection(ETBNullCollection); // Clear
      debug writeln("this.database"); 
    if (this.database) {
      debug writeln("Found database -this.database"); 

      debug writeln("this.site");
      if (this.site) {
        this.tenant(database[site]);
      }

      debug writeln("this.tenant");
      if (this.tenant) {
        this.collection(this.tenant[this.collectionName]);
      }
    }  
  }
}
mixin(ControllerCalls!("ActionController", "DActionController"));