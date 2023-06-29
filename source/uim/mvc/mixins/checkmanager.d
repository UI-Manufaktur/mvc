/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.checkmanager;

import uim.mvc;
@safe:

mixin template CheckManagerTemplate() {
  void addChecks(ICheck[] someChecks) {
    _checks ~= someChecks;
  }

  void addCheck(ICheck aCheck) {
    _checks ~= aCheck;
  }
}