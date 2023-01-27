module uim.mvc.mixins.view;

@safe:
import uim.mvc;

string mvcViewThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IController myController) { this().controller(myController); }
  `;
}

template MVCViewThis(string name) {
  const char[] MVCViewThis = mvcViewThis(name);
}

string mvcViewCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DMVCApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(IController myController) { return new `~className~`(myController); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DMVCApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template MVCViewCalls(string shortName, string className) {
  const char[] MVCViewCalls = mvcViewCalls(shortName, className);
}
