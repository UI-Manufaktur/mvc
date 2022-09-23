module uim.mvc.mixins.controller;

@safe:
import uim.mvc;

string mvcControllerThis(string name) {
  return
    mvcBaseThis(name);
}

template MVCControllerThis(string name) {
  const char[] MVCControllerThis = mvcControllerThis(name);
}

string mvcControllerCalls(string shortName, string className) {
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

template MVCControllerCalls(string shortName, string className) {
  const char[] MVCControllerCalls = mvcControllerCalls(shortName, className);
}


