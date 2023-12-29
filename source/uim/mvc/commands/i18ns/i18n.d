/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.i18ns.i18n;

import uim.mvc;

@safe:
class DI18nCommand {
  this() { initialize; }

  override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings); 
  }
}
auto I18nCommand() { return new DI18nCommand; }

version(test_uim_mvc) { unittest {
  assert(I18nCommand);
}}