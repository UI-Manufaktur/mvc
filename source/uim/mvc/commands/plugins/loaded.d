/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.plugins.loaded;

import uim.mvc;
@safe:

class DPluginLoadedCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginLoadedCommand() { return new DPluginLoadedCommand; }

version(test_uim_mvc) { unittest {
  assert(PluginLoadedCommand);
}}