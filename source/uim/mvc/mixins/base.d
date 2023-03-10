/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.mixins.base;

@safe:
import uim.mvc;

string mvcObjectThis(string name) {
  return `
    this() { super("`~name~`"); }
    this(DConfigurationValue configSettings) { super("`~name~`", configSettings); }
    this(DMVCApplication myApplication, Json configSettings = Json(null)) { this(configSettings).application(myApplication); }

    this(string myName, Json configSettings = Json(null)) { this(configSettings).name(myName); }
    this(string[string] myParameters, Json configSettings = Json(null)) { this(configSettings).parameters(myParameters); }

    this(DMVCApplication myApplication, string myName, Json configSettings = Json(null)) { this(myApplication, configSettings).name(myName); }
    this(DMVCApplication myApplication, string[string] myParameters, Json configSettings = Json(null)) { this(myApplication, configSettings).parameters(myParameters); }

    this(string myName, string[string] myParameters, Json configSettings = Json(null)) { this(name, configSettings).parameters(myParameters); }
    this(DMVCApplication myApplication, string myName, string[string] myParameters, Json configSettings = Json(null)) { this(myApplication, name, configSettings).parameters(myParameters); }

    override DMVCObject create() {
      return `~name~`;
    }
  `;
}

template MVCObjectThis(string name) {
  const char[] MVCObjectThis = mvcObjectThis(name);
}

string mvcObjectCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;
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

template MVCObjectCalls(string shortName, string className = null) {
  const char[] MVCObjectCalls = mvcObjectCalls(shortName, className);
}


