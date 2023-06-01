module uim.mvc.controllers.container;

import uim.mvc;
@safe:

class DControllerContainer {
  this() {}

  DController[string] _items;
  mixin(OProperty!("IApp", "owningApp"));

  DController byName(string controllerName) {
    return _items.get(controllerName, null);
  }

  string[] keys() {
    return _items.keys.array;
  }

  DController[] controllers() {
    return _items.byValue.array;
  }

  O add(this O)(string name, DController newController) {
    _items[name] = newController;
    return cast(O)this;
  }
}
auto ControllerContainer() { return new DControllerContainer; }