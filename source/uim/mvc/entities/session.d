/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.entities.session;

@safe:
import uim.mvc;

class DSessionEntity : DEntity {
  mixin(EntityThis!("SessionEntity"));
  
override void initialize(DConfigurationValue configSettings = null) {
    version(test_uim_mvc) { debugMethodCall(moduleName!SessionEntity~"::SessionEntity("~this.name~"):initialize"); }  
    super.initialize(configSettings);
  }
}
mixin(EntityCalls!("SessionEntity"));
