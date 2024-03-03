/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.i18ns.init;

import uim.mvc;

@safe:
class DI18nInitCommand {
  this() { initialize; }

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings); 
  }
}
auto I18nInitCommand() { return new DI18nInitCommand; }

version(test_uim_mvc) { unittest {
  assert(I18nInitCommand);
}}