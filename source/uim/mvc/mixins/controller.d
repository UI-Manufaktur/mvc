/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.mixins.controller;

@safe:
import uim.mvc;

string mvcControllerThis(string name) {
  return
    mvcObjectThis(name);
}

template ControllerThis(string name) {
  const char[] ControllerThis = mvcControllerThis(name);
}

string mvcControllerCalls(string shortName, string className = "") {
  string clName = className ? className : "D"~shortName;
  return `
    auto `~shortName~`() { return new `~clName~`; }
    auto `~shortName~`(DMVCApplication myApplication) { return new `~clName~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~clName~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~clName~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~clName~`(myName, myParameters); }

    auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~clName~`(myApplication, myName); }
    auto `~shortName~`(DMVCApplication myApplication, string[string] myParameters) { return new `~clName~`(myApplication, myParameters); }
  `;
}

template ControllerCalls(string shortName, string className = "") {
  const char[] ControllerCalls = mvcControllerCalls(shortName, className);
}


