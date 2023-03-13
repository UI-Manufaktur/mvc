/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.mixins;

public import uim.mvc.mixins.action;
public import uim.mvc.mixins.base;
public import uim.mvc.mixins.controller;
public import uim.mvc.mixins.controllercomponent;
public import uim.mvc.mixins.layout;
public import uim.mvc.mixins.model;
public import uim.mvc.mixins.page;
public import uim.mvc.mixins.router;
public import uim.mvc.mixins.view;
public import uim.mvc.mixins.viewcomponent;

template MVCParameter(string name) {
  const char[] MVCParameter = `
    O `~name~`(this O)(string value) {
      this.parameter("`~name~`", value);
      return cast(O)this;
    }
    string `~name~`() {
      return this.parameter("`~name~`");
    }
  `;
}