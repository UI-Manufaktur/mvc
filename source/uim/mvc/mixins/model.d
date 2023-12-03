/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.model;

import uim.mvc;
@safe:

string mvcModelThis(string objName, string className = null) {
  string clName = (className ? className : objName);
    return
    mvcObjectThis(clName);
}

template ModelThis(string name) {
  const char[] ModelThis = mvcModelThis(name);
}

string mvcModelCalls(string shortName, string className = null) {
  string clName = (className ? className : "D"~shortName);

  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(IApplication anApplication) { return new `~className~`(anApplication); }
    auto `~shortName~`(string aName) { return new `~className~`(aName); }
    auto `~shortName~`(STRINGAA someParameters) { return new `~className~`(someParameters); }

    auto `~shortName~`(string aName, STRINGAA someParameters) { return new `~className~`(aName, someParameters); }

    auto `~shortName~`(IApplication anApplication, string aName) { return new `~className~`(anApplication, aName); }
    auto `~shortName~`(IApplication anApplication, STRINGAA someParameters) { return new `~className~`(anApplication, someParameters); }
  `;
}

template ModelCalls(string shortName, string className) {
  const char[] ModelCalls = mvcModelCalls(shortName, className);
}
