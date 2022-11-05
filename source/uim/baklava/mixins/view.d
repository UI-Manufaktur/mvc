module uim.baklava.mixins.view;

@safe:
import uim.baklava;

string mvcViewThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IBLVController myController) { this().controller(myController); }
  `;
}

template BLVViewThis(string name) {
  const char[] BLVViewThis = mvcViewThis(name);
}

string mvcViewCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DBLVApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(IBLVController myController) { return new `~className~`(myController); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DBLVApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DBLVApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BLVViewCalls(string shortName, string className) {
  const char[] BLVViewCalls = mvcViewCalls(shortName, className);
}
