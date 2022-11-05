module uim.baklava.mixins.controller;

@safe:
import uim.baklava;

string mvcControllerThis(string name) {
  return
    mvcBaseThis(name);
}

template BLVControllerThis(string name) {
  const char[] BLVControllerThis = mvcControllerThis(name);
}

string mvcControllerCalls(string shortName, string className) {
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

template BLVControllerCalls(string shortName, string className) {
  const char[] BLVControllerCalls = mvcControllerCalls(shortName, className);
}


