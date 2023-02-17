module uim.mvc.mixins.view;

@safe:
import uim.mvc;

auto viewThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(DController myController) { this().controller(myController); }
  `;
}

template ViewThis(string name) {
  const char[] ViewThis = viewThis(name);
}

string viewCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;

  return `
    auto `~shortName~`() { return new `~clName~`; }
    auto `~shortName~`(DMVCApplication myApplication) { return new `~clName~`(myApplication); }
    auto `~shortName~`(DController myController) { return new `~clName~`(myController); }
    auto `~shortName~`(string myName) { return new `~clName~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~clName~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~clName~`(myName, myParameters); }

    auto `~shortName~`(DMVCApplication myApplication, string myName) { return new `~clName~`(myApplication, myName); }
    auto `~shortName~`(DMVCApplication myApplication, string[string] myParameters) { return new `~clName~`(myApplication, myParameters); }
  `;
}

template ViewCalls(string shortName, string className = null) {
  const char[] ViewCalls = viewCalls(shortName, className);
}
