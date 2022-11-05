module uim.baklava.mixins.controllercomponent;

@safe:
import uim.baklava;

string mvcControllerComponentThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IBLVController myController) { this().controller(myController); }
  `;
}

template BLVControllerComponentThis(string name) {
  const char[] BLVControllerComponentThis = mvcControllerComponentThis(name);
}

string mvcControllerComponentCalls(string shortName, string className) {
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

template BLVControllerComponentCalls(string shortName, string className) {
  const char[] BLVControllerComponentCalls = mvcControllerComponentCalls(shortName, className);
}


