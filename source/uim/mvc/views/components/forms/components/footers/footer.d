/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.footers.footer;

@safe:
import uim.mvc;

class DFormFooter : DFormComponent {
  mixin(ViewComponentThis!("MVCFormFooter"));

  override void initialize(Json configSetting = Json(null)) {
    debugMethodCall(moduleName!DFormFooter~"::DFormFooter("~this.name~"):initialize");   
    super.initialize(configSettings);

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(ViewComponentCalls!("MVCFormFooter", "DFormFooter"));

version(test_uim_mvc) { unittest {
  assert(MVCFormFooter);
}}