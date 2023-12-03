/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controller;

import uim.mvc;
@safe:

string mvcControllerThis(string name) {
  return `
    this() { super("`~name~`"); }

    this(IControllerManager aManager) { this().manager(aManager); }
    this(string aName) { this().name(aName); }
    this(STRINGAA someParameters) { this().parameters(someParameters); }
    this(Json aConfigSettings) { this().initialize(aConfigSettings); }

    this(IControllerManager aManager, string aName) { this(aManager).name(aName); }
    this(IControllerManager aManager, STRINGAA someParameters) { this(aManager).parameters(someParameters); }
    this(IControllerManager aManager, Json aConfigSettings) { this(aManager).initialize(aConfigSettings); }

    this(string aName, STRINGAA someParameters) { this(aName).parameters(someParameters); }
    this(string aName, Json aConfigSettings) { this(aName).initialize(aConfigSettings); }

    this(STRINGAA someParameters, Json aConfigSettings) { this(someParameters).initialize(aConfigSettings); }

    this(IControllerManager aManager, string aName, STRINGAA someParameters) { this(aManager, aName).parameters(someParameters); }
    this(IControllerManager aManager, string aName, Json aConfigSettings) { this(aManager, aName).initialize(aConfigSettings); }
    this(IControllerManager aManager, STRINGAA someParameters, Json aConfigSettings) { this(aManager, someParameters).initialize(aConfigSettings); }
 
    this(string aName, STRINGAA someParameters, Json aConfigSettings) { this(aName, someParameters).initialize(aConfigSettings); }

    this(IControllerManager aManager, string aName, STRINGAA someParameters, Json aConfigSettings) { this(aManager, aName, someParameters).initialize(aConfigSettings); }
    
    override DMVCObject create() {
      return `~name~`;
    }`;
}

template ControllerThis(string name) {
  const char[] ControllerThis = mvcControllerThis(name);
}

string mvcControllerCalls(string shortName, string className = null) {
  string clName = className.length > 0 ? className : "D"~shortName;
  return `
    auto `~shortName~`() { return new `~clName~`; }

    auto `~shortName~`(IControllerManager aManager) { return new `~clName~`(aManager); }
    auto `~shortName~`(string aName) { return new `~clName~`(aName); }
    auto `~shortName~`(STRINGAA someParameters) { return new `~clName~`(someParameters); }
    auto `~shortName~`(Json aConfigSettings) { return new `~clName~`(aConfigSettings); }

    auto `~shortName~`(IControllerManager aManager, string aName) { return new `~clName~`(aManager, aName); }
    auto `~shortName~`(IControllerManager aManager, STRINGAA someParameters) { return new `~clName~`(aManager, someParameters); }
    auto `~shortName~`(IControllerManager aManager, Json aConfigSettings) { return new `~clName~`(aManager, aConfigSettings); }

    auto `~shortName~`(string aName, STRINGAA someParameters) { return new `~clName~`(aName, someParameters); }
    auto `~shortName~`(string aName, Json aConfigSettings) { return new `~clName~`(aName, aConfigSettings); }

    auto `~shortName~`(STRINGAA someParameters, Json aConfigSettings) { return new `~clName~`(someParameters, aConfigSettings); }    

    auto `~shortName~`(IControllerManager aManager, string aName, STRINGAA someParameters) { return new `~clName~`(aManager, aName, someParameters); }
    auto `~shortName~`(IControllerManager aManager, STRINGAA someParameters, Json aConfigSettings) { return new `~clName~`(aManager, someParameters, aConfigSettings); }

    auto `~shortName~`(string aName, STRINGAA someParameters, Json aConfigSettings) { return new `~clName~`(aName, someParameters, aConfigSettings); }

    auto `~shortName~`(IControllerManager aManager, string aName, STRINGAA someParameters, Json aConfigSettings) { return new `~clName~`(aManager, aName, someParameters, aConfigSettings); }
  `;
}

template ControllerCalls(string shortName, string className = null) {
  const char[] ControllerCalls = mvcControllerCalls(shortName, className);
}

/* template ControllerCalls(string rootName, string controllerGroupName, string appName) {
  const char[] ControllerCalls = `
void `~rootName~`Index(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Index~":`~rootName~`Index");

  `~controllerGroupName~`IndexPageController(`~appName~`).request(req, res);
}

void `~rootName~`Create(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Create~":`~rootName~`Create");

  `~controllerGroupName~`CreatePageController(`~appName~`).request(req, res);
}

void `~rootName~`View(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`View~":`~rootName~`View");

  `~controllerGroupName~`ReadPageController(`~appName~`).request(req, res);
}

void `~rootName~`Edit(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Edit~":`~rootName~`Edit");

  `~controllerGroupName~`UpdatePageController(`~appName~`).request(req, res);
}
void `~rootName~`Delete(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`Delete~":`~rootName~`Delete");

  `~controllerGroupName~`DeletePageController(`~appName~`).request(req, res);
}`;
} */