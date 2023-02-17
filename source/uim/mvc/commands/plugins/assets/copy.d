module uim.mvc.commands.plugins.assets.copy;

@safe:
import uim.mvc;

class DPluginAssetsCopyCommand {
  this() { initialize; }

  void initialize() {
    // 
  }
}
auto PluginAssetsCopyCommand() { return new DPluginAssetsCopyCommand; }

version(test_uim_apps) { unittest {
  assert(PluginAssetsCopyCommand);
}}