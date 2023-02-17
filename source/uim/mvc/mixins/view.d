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
  return
    mvcObjectCalls(shortName, className)~
    `
    auto `~shortName~`(DController aController) { return new `~clName~`().controller(aController); }
    `;
}

template ViewCalls(string shortName, string className = null) {
  const char[] ViewCalls = viewCalls(shortName, className);
}
