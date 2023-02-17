module uim.mvc.commands.plugins.unload;

@safe:
import uim.mvc;

class DPluginUnloadCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto PluginUnloadCommand() { return new DPluginUnloadCommand; }

version(test_uim_mvc) { unittest {
  assert(PluginUnloadCommand);
}}