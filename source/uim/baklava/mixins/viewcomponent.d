module uim.baklava.mixins.viewcomponent;

@safe:
import uim.baklava;

string mvcViewComponentThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IBLVView myView) { this().view(myView); }
  `;
}

template BLVViewComponentThis(string name) {
  const char[] BLVViewComponentThis = mvcViewComponentThis(name);
}

string mvcViewComponentCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DBLVApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DBLVApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DBLVApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BLVViewComponentCalls(string shortName, string className) {
  const char[] BLVViewComponentCalls = mvcViewComponentCalls(shortName, className);
}
