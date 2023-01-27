module uim.baklava.mixins.viewcomponent;

@safe:
import uim.baklava;

string mvcViewComponentThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IBKLView myView) { this().view(myView); }
  `;
}

template BKLViewComponentThis(string name) {
  const char[] BKLViewComponentThis = mvcViewComponentThis(name);
}

string mvcViewComponentCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DBKLApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DBKLApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DBKLApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BKLViewComponentCalls(string shortName, string className) {
  const char[] BKLViewComponentCalls = mvcViewComponentCalls(shortName, className);
}
