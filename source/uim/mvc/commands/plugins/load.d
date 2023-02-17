module uim.mvc.commands.plugins.load;

@safe:
import uim.mvc;

class DPluginAssetsRemoveCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginAssetsRemoveCommand() { return new DPluginAssetsRemoveCommand; }

version(test_uim_apps) { unittest {
  assert(PluginAssetsRemoveCommand);
}}