/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.plugins.unload;

import uim.mvc;

@safe:
class DPluginUnloadCommand {
  this() { initialize; }

  override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings); 
  }
}
auto PluginUnloadCommand() { return new DPluginUnloadCommand; }

version(test_uim_mvc) { unittest {
  assert(PluginUnloadCommand);
}}