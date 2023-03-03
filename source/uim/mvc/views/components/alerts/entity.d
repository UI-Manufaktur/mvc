/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.alerts.entity;

@safe:
import uim.mvc;

class DAPPEntityAlertViewComponent : DAPPAlertViewComponent {
  mixin(ViewComponentThis!("APPEntityAlertViewComponent"));
}
mixin(ViewComponentCalls!("APPEntityAlertViewComponent"));