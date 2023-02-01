module uim.mvc.mixins.view;

@safe:
import uim.mvc;

string ViewThis(string name) {
  return 
    mvcBaseThis(name)~
  `
    this(IController myController) { this().controller(myController); }
  `;
}

template ViewThis(string name) {
  const char[] ViewThis = ViewThis(name);
}

string ViewCalls(string shortName, string className) {
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

template ViewCalls(string shortName, string className) {
  const char[] ViewCalls = ViewCalls(shortName, className);
}
