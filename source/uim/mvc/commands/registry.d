/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.registry;

import uim.mvc;

@safe:
class DCommandRegistry : DRegistry!DCommand{
  this() {}

  static DCommandRegistry registry; 
}
auto CommandRegistry() { 
  if (!DCommandRegistry.registry) {
    DCommandRegistry.registry = new DCommandRegistry; 
  }
  return 
    DCommandRegistry.registry;
}

version(test_uim_mvc) { unittest {
  assert(CommandRegistry.register("mvc/command",  Command).paths == ["mvc/command"]);
  assert(CommandRegistry.register("mvc/command2", Command).paths.length == 2);
}}