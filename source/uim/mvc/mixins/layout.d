module uim.baklava.mixins.layout;

@safe:
import uim.baklava;

string mvcLayoutThis(string name) {
  return
    mvcBaseThis(name);
}

template BKLLayoutThis(string name) {
  const char[] BKLLayoutThis = mvcLayoutThis(name);
}

string mvcLayoutCalls(string shortName, string className) {
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

template BKLLayoutCalls(string shortName, string className) {
  const char[] BKLLayoutCalls = mvcLayoutCalls(shortName, className);
}
