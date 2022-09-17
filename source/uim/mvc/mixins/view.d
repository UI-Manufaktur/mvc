module uim.mvc.mixins.view;

string mvcViewThis(string name) {
  return `
    this() { super(); this.name("`~name~`"); }
    this(DMVCApplication myApplication) { this().app(myApplication); }
    this(string myName) { this().name(myName); }
    this(STRINGAA myOptions) { this().options(myOptions); }

    this(DMVCApplication myApplication, string myName) { this(myApplication).name(myName); }
    this(DMVCApplication myApplication, STRINGAA myOptions) { this(myApplication).options(myOptions); }

    this(string myName, STRINGAA myOptions) { this(name).options(myOptions); }
    this(DMVCApplication myApplication, string myName, STRINGAA myOptions) { this(myApplication, name).options(myOptions); }
  `);
}

template MVCViewThis(string name) {
  const char[] MVCViewThis = mvcViewThis(name);
}

string mvcViewCalls(string shortName, string className) {
  return `
auto `~shortName~`() { return new `~className~`; }
auto `~shortName~`(DMVCApplication myApplication) { return new `~className~`(myApplication); }
auto `~shortName~`(string myName) { return new `~className~`(myName); }
auto `~shortName~`(STRINGAA myOptions) { return new `~className~`(myOptions); }

auto `~shortName~`(string myName, STRINGAA myOptions) { return new `~className~`(myName, myOptions); }

auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
auto `~shortName~`(DMVCApplication myApplication, STRINGAA myOptions) { return new `~className~`(myApplication, myOptions); }
`);
}

template MVCViewCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] MVCViewCalls = mvcViewCalls(name, withEntity, withEntities);
}
