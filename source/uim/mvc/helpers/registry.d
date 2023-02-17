module uim.mvc.helpers.registry;

@safe:
import uim.mvc;

class DHelperRegistry {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto HelperRegistry() { return new DHelperRegistry; }

version(test_uim_apps) { unittest {
  assert(HelperRegistry);
}}