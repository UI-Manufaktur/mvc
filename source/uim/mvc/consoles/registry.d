/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.consoles.registry;

@safe:
import uim.mvc;

class DConsoleRegistry : DRegistry!DConsole{
  this() {}

  static DConsoleRegistry registry; 
}
auto ConsoleRegistry() { 
  if (!DConsoleRegistry.registry) {
    DConsoleRegistry.registry = new DConsoleRegistry; 
  }
  return 
    DConsoleRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(ConsoleRegistry.register("mvc/console",  Console).paths == ["mvc/console"]);
  assert(ConsoleRegistry.register("mvc/console2", Console).paths.length == 2);
}}