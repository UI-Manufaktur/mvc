module uim.mvc.mixins.controller;

string mvcControllerThis(string name) {
  return `
this() { super(); this.name("`~name~`"); }
this(DAPPApplication myApplication) { this().app(myApplication); }
this(string myName) { this().name(myName); }
this(STRINGAA myOptions) { this().options(myOptions); }

this(DAPPApplication myApplication, string myName) { this(myApplication).name(myName); }
this(DAPPApplication myApplication, STRINGAA myOptions) { this(myApplication).options(myOptions); }

this(string myName, STRINGAA myOptions) { this(name).options(myOptions); }
this(DAPPApplication myApplication, string myName, STRINGAA myOptions) { this(myApplication, name).options(myOptions); }
`);
}

template mvcControllerThis(string name) {
  const char[] mvcControllerThis = mvcControllerThis(name);
}

string mvcControllerCalls(string shortName, string className) {
  return `
auto `~shortName~`() { return new `~className~`; }
auto `~shortName~`(DAPPApplication myApplication) { return new `~className~`(myApplication); }
auto `~shortName~`(string myName) { return new `~className~`(myName); }
auto `~shortName~`(DAPPApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
`);
}

template mvcControllerCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] mvcControllerCalls = mvcControllerCalls(name, withEntity, withEntities);
}


