module uim.mvc.views.container;

import uim.mvc;
@safe:

class DViewContainer {
  this() {}

  DView[string] _items;

  DView byName(string viewName) {
    return _items.get(viewName, null);
  }

  string[] keys() {
    return _items.keys.array;
  }

  DView[] views() {
    return _items.byValue.array;
  }

  O add(this O)(string name, DView newView) {
    _items[name] = newView;
    return cast(O)this;
  }
}
auto ViewContainer() { return new DViewContainer; }