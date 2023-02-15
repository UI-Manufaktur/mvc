/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controllercomponent;

@safe:
import uim.mvc;

string mvcControllerComponentThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(IController myController) { this().controller(myController); }
  `;
}

template ControllerComponentThis(string name) {
  const char[] ControllerComponentThis = mvcControllerComponentThis(name);
}

string mvcControllerComponentCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DMVCApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DMVCApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template ControllerComponentCalls(string shortName, string className) {
  const char[] ControllerComponentCalls = mvcControllerComponentCalls(shortName, className);
}


