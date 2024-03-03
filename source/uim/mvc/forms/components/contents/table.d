/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.contents.table;

import uim.mvc;

@safe:
class DTableFormContent : DMVCEntitiesViewComponent {
  mixin(ViewComponentThis!("MVCTableFormContent"));

  mixin(OProperty!("DViewComponent", "row"));

  override bool initialize(IData[string] configSettings = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!DTableFormContent~"::DTableFormContent("~this.className~"):initialize"); }
    super.initialize(configSettings);
  }
}
mixin(ViewComponentCalls!("MVCTableFormContent", "DTableFormContent"));

version(test_uim_mvc) { unittest {
  assert(MVCTableFormContent);
}}