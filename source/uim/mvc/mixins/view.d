module uim.mvc.mixins.view;

@safe:
import uim.mvc;

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
    auto `~shortName~`(DMVCApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(IBKLController myController) { return new `~className~`(myController); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DMVCApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BKLViewCalls(string shortName, string className) {
  const char[] BKLViewCalls = mvcViewCalls(shortName, className);
}
