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

version(test_uim_apps) { unittest {
  assert(PluginAssetsSymlinkCommand);
}}