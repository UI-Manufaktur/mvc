/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.i18ns.extract;

@safe:
import uim.mvc;

class DI18nExtractCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto I18nExtractCommand() { return new DI18nExtractCommand; }

version(test_uim_mvc) { unittest {
  assert(I18nExtractCommand);
}}