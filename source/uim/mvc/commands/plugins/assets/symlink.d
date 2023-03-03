/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.commands.plugins.assets.symlink;

@safe:
import uim.mvc;

class DPluginAssetsSymlinkCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginAssetsSymlinkCommand() { return new DPluginAssetsSymlinkCommand; }

version(test_uim_mvc) { unittest {
  assert(PluginAssetsSymlinkCommand);
}}