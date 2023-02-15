module uim.mvc.mixins.viewcomponent;

@safe:
import uim.mvc;

string viewComponentThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(IView myView) { this().view(myView); }
  `;
}

template ViewComponentThis(string name) {
  const char[] ViewComponentThis = viewComponentThis(name);
}

string viewComponentCalls(string shortName, string className) {
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

template ViewComponentCalls(string shortName, string className) {
  const char[] ViewComponentCalls = viewComponentCalls(shortName, className);
}
