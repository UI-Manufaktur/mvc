/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllercomponent;

import uim.mvc;
@safe:

string controllerComponentThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(IControllerComponentManager aManager) { this().manager(aManager); }
    this(IControllerComponentManager aManager, string aName) { this(aManager).name(aName); }
    this(IControllerComponentManager aManager, string[string] someParameters) { this(aManager).parameters(someParameters); }
    this(IControllerComponentManager aManager, string aName, string[string] someParameters) { this(aManager, aName).parameters(someParameters); }
  `;
}

template ControllerComponentThis(string name) {
  const char[] ControllerComponentThis = controllerComponentThis(name);
}

string mvcControllerComponentCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;
  return `
    auto `~shortName~`() { return new `~clName~`; }
    auto `~shortName~`(IControllerComponentManager aManager) { return new `~clName~`(aManager); }
    auto `~shortName~`(string aName) { return new `~clName~`(aName); }
    auto `~shortName~`(string[string] someParameters) { return new `~clName~`(someParameters); }

    auto `~shortName~`(string aName, string[string] someParameters) { return new `~clName~`(aName, someParameters); }

    auto `~shortName~`(IControllerComponentManager aManager, string aName) { return new `~clName~`(aManager, aName); }
    auto `~shortName~`(IControllerComponentManager aManager, string[string] someParameters) { return new `~clName~`(aManager, someParameters); }
  `;
}

template ControllerComponentCalls(string shortName, string className = null) {
  const char[] ControllerComponentCalls = mvcControllerComponentCalls(shortName, className);
}


