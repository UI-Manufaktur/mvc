module uim.baklava.mixins.model;

@safe:
import uim.baklava;

string mvcModelThis(string name) {
  return
    mvcBaseThis(name);
}

template BLVModelThis(string name) {
  const char[] BLVModelThis = mvcModelThis(name);
}

string mvcModelCalls(string shortName, string className) {
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

template BLVModelCalls(string shortName, string className) {
  const char[] BLVModelCalls = mvcModelCalls(shortName, className);
}
