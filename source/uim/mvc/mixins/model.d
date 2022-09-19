public import uim.mvc.mixins.model;

string MVCModelThis(string name) {
  return `
    this() { super(); this.name("`~name~`"); }
    this(DMVCApplication myApplication) { this().app(myApplication); }
    this(string myName) { this().name(myName); }
    this(STRINGAA myOptions) { this().options(myOptions); }

    this(DMVCApplication myApplication, string myName) { this(myApplication).name(myName); }
    this(DMVCApplication myApplication, STRINGAA myOptions) { this(myApplication).options(myOptions); }

    this(string myName, STRINGAA myOptions) { this(name).options(myOptions); }
    this(DMVCApplication myApplication, string myName, STRINGAA myOptions) { this(myApplication, name).options(myOptions); }
  `;
}

template MVCModelThis(string name) {
  const char[] MVCModelThis = MVCModelThis(name);
}

string MVCModelCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DMVCApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(STRINGAA myOptions) { return new `~className~`(myOptions); }

    auto `~shortName~`(string myName, STRINGAA myOptions) { return new `~className~`(myName, myOptions); }

    auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DMVCApplication myApplication, STRINGAA myOptions) { return new `~className~`(myApplication, myOptions); }
  `;
}

template MVCModelCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] MVCModelCalls = MVCModelCalls(name, withEntity, withEntities);
}
