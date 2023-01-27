module uim.mvc.mixins;

public import uim.mvc.mixins.base;
public import uim.mvc.mixins.layout;
public import uim.mvc.mixins.model;
public import uim.mvc.mixins.view;
public import uim.mvc.mixins.viewcomponent;
public import uim.mvc.mixins.controller;
public import uim.mvc.mixins.controllercomponent;

template BKLParameter(string name) {
  const char[] BKLParameter = `
    O `~name~`(this O)(string value) {
      this.parameter("`~name~`", value);
      return cast(O)this;
    }
    string `~name~`() {
      return this.parameter("`~name~`");
    }
  `;
}