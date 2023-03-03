/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.commands.i18ns.init;

@safe:
import uim.mvc;

class DI18nInitCommand {
  this() { initialize; }

  void initialize() {
    // 
  }
}
auto I18nInitCommand() { return new DI18nInitCommand; }

version(test_uim_mvc) { unittest {
  assert(I18nInitCommand);
}}