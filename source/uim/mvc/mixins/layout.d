/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module  uim.mvc.mixins.layout;

@safe:
import uim.mvc;

string LayoutThis(string name) {
  return
    mvcObjectThis(name);
}

template LayoutThis(string name) {
  const char[] LayoutThis = LayoutThis(name);
}

string LayoutCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(IApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(IApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(IApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template LayoutCalls(string shortName, string className) {
  const char[] LayoutCalls = LayoutCalls(shortName, className);
}
