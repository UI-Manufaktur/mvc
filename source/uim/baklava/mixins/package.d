module uim.baklava.mixins;

public import uim.baklava.mixins.base;
public import uim.baklava.mixins.layout;
public import uim.baklava.mixins.model;
public import uim.baklava.mixins.view;
public import uim.baklava.mixins.viewcomponent;
public import uim.baklava.mixins.controller;
public import uim.baklava.mixins.controllercomponent;

template BLVParameter(string name) {
  const char[] BLVParameter = `
    O `~name~`(this O)(string value) {
      this.parameter("`~name~`", value);
      return cast(O)this;
    }
    string `~name~`() {
      return this.parameter("`~name~`");
    }
  `;
}