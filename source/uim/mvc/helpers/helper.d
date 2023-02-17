module uim.mvc.helpers.helper;

@safe:
import uim.mvc;

class DHelper {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto Helper() { return new DHelper; }

version(test_uim_apps) { unittest {
  assert(Helper);
}}