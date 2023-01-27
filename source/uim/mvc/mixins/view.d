module uim.baklava.mixins.view;

@safe:
import uim.baklava;

string mvcViewThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IBKLController myController) { this().controller(myController); }
  `;
}

template BKLViewThis(string name) {
  const char[] BKLViewThis = mvcViewThis(name);
}

string mvcViewCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DBKLApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(IBKLController myController) { return new `~className~`(myController); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DBKLApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DBKLApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BKLViewCalls(string shortName, string className) {
  const char[] BKLViewCalls = mvcViewCalls(shortName, className);
}
