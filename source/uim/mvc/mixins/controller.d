module uim.baklava.mixins.controller;

@safe:
import uim.baklava;

string mvcControllerThis(string name) {
  return
    mvcBaseThis(name);
}

template BKLControllerThis(string name) {
  const char[] BKLControllerThis = mvcControllerThis(name);
}

string mvcControllerCalls(string shortName, string className) {
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

template BKLControllerCalls(string shortName, string className) {
  const char[] BKLControllerCalls = mvcControllerCalls(shortName, className);
}


