/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.accordions.themes;

@safe:
import uim.mvc;

class DAPPAccordionThemes : DAPPAccordion {
  mixin(ViewComponentThis!("APPAccordionThemes"));

override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
    
    this
      .id("accordion-themes"); 
  }
}
mixin(ViewComponentCalls!("APPAccordionThemes"));
