module uim.baklava.mixins.viewcomponent;

@safe:
import uim.baklava;

string mvcViewComponentThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IMVCView myView) { this().view(myView); }
  `;
}

template MVCViewComponentThis(string name) {
  const char[] MVCViewComponentThis = mvcViewComponentThis(name);
}

string mvcViewComponentCalls(string shortName, string className) {
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

template MVCViewComponentCalls(string shortName, string className) {
  const char[] MVCViewComponentCalls = mvcViewComponentCalls(shortName, className);
}
