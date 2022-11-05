module uim.baklava.mixins.layout;

@safe:
import uim.baklava;

string mvcLayoutThis(string name) {
  return
    mvcBaseThis(name);
}

template BLVLayoutThis(string name) {
  const char[] BLVLayoutThis = mvcLayoutThis(name);
}

string mvcLayoutCalls(string shortName, string className) {
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

template BLVLayoutCalls(string shortName, string className) {
  const char[] BLVLayoutCalls = mvcLayoutCalls(shortName, className);
}
