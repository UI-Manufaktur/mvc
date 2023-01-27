/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.footers.footer;

@safe:
import uim.mvc;

class DMVCFormFooter : DMVCFormComponent {
  mixin(MVCViewComponentThis!("MVCFormFooter"));

  override void initialize() {
    debugMethodCall(moduleName!DMVCFormFooter~"::DMVCFormFooter("~this.name~"):initialize");   
    super.initialize;

    debug writeln("In ", __MODULE__, "/", __LINE__);
  }
}
mixin(MVCViewComponentCalls!("MVCFormFooter", "DMVCFormFooter"));

version(test_baklava) { unittest {
  assert(MVCFormFooter);
}}