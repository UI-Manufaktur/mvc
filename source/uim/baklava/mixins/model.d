module uim.baklava.mixins.model;

@safe:
import uim.baklava;

string mvcModelThis(string name) {
  return
    mvcBaseThis(name);
}

template BKLModelThis(string name) {
  const char[] BKLModelThis = mvcModelThis(name);
}

string mvcModelCalls(string shortName, string className) {
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

template BKLModelCalls(string shortName, string className) {
  const char[] BKLModelCalls = mvcModelCalls(shortName, className);
}
