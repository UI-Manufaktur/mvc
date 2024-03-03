/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.base;

import uim.mvc;
@safe:

string mvcObjectThis(string name) {
  return `
    this() { super("`~name~`"); this.className("`~name~`"); }
    this(IData[string] configSettings = nullSettings) { super("`~name~`", configSettings); }
    this(IApplication myApplication, IData[string] configSettings = null) { this(configSettings).application(myApplication); }

    this(string myName, IData[string] configSettings = null) { this(configSettings).name(myName); }
    this(STRINGAA myParameters, IData[string] configSettings = null) { this(configSettings).parameters(myParameters); }

    this(IApplication myApplication, string myName, IData[string] configSettings = null) { this(myApplication, configSettings).name(myName); }
    this(IApplication myApplication, STRINGAA myParameters, IData[string] configSettings = null) { this(myApplication, configSettings).parameters(myParameters); }

    this(string myName, STRINGAA myParameters, IData[string] configSettings = null) { this(name, configSettings).parameters(myParameters); }
    this(IApplication myApplication, string myName, STRINGAA myParameters, IData[string] configSettings = null) { this(myApplication, name, configSettings).parameters(myParameters); }

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
    auto `~shortName~`(IApplication myApplication) { return new `~clName~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~clName~`(myName); }
    auto `~shortName~`(STRINGAA myParameters) { return new `~clName~`(myParameters); }

    auto `~shortName~`(string myName, STRINGAA myParameters) { return new `~clName~`(myName, myParameters); }

    auto `~shortName~`(IApplication myApplication, string myName) { return new `~clName~`(myApplication, myName); }
    auto `~shortName~`(IApplication myApplication, STRINGAA myParameters) { return new `~clName~`(myApplication, myParameters); }
  `;
}

template MVCObjectCalls(string shortName, string className = null) {
  const char[] MVCObjectCalls = mvcObjectCalls(shortName, className);
}


