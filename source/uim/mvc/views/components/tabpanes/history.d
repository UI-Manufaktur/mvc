/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components.tabpanes.history;

import uim.mvc;

@safe:
class DAPPHistoryTabpane : DAPPEntitiesTabpane {
  mixin(ViewComponentThis!("APPHistoryTabpane"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("APPHistoryTabpane"));
/* 
class DAPPPaneHistory : DAPPPane {
  this() { super();     
    this.title("History");
  }
  this(DEntity myEntity) { this(); this.entity(myEntity); }    
  this(DEntity myEntity, DEntity[] myHistory) { this(); this.entity(myEntity).history(myHistory); }    

  mixin(OProperty!("DEntity[]", "history"));
  O history(this O)(Json[] jsons) {
    _history ~= jsons.map!(a => OOPEntity(a)).array;
    return cast(O)this;
  }

  override DH5Obj[] toH5(STRINGAA options = null) { // hook
    super.toH5(options);
    
    return [
      BS5CardBody(
        H5Div(["card-title"], options.get("title", "History")),
        BS5Row( 
          BS5Col(["col-12"], 
            /* APPTableHistory.history(history).toH5(options) * /
          )))].toH5;
  } 
}

   */