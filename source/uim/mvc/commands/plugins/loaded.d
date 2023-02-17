module uim.mvc.commands.plugins.loaded;

@safe:
import uim.mvc;

class DPluginLoadedCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginLoadedCommand() { return new DPluginLoadedCommand; }

version(test_uim_apps) { unittest {
  assert(PluginLoadedCommand);
}}