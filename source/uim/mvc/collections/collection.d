module uim.mvc.collections.collection;

@safe:
import uim.mvc;

class DCollection {
  this() { initialize; }

  void initialize() {
    // 
  }
}
auto Collection() { return new DCollection; }

version(test_uim_mvc) { unittest {
  assert(Collection);
}}