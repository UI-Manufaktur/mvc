module uim.mvc.mixins.viewcomponent;

@safe:
import uim.mvc;

string viewComponentThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(DView myView) { this().view(myView); }
  `;
}

template ViewComponentThis(string name) {
  const char[] ViewComponentThis = viewComponentThis(name);
}

string viewComponentCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;
  return
    mvcObjectCalls(shortName, className)~
    `auto `~shortName~`(DView aView) { return new `~clName~`(aView); }`;
}

template ViewComponentCalls(string shortName, string className = null) {
  const char[] ViewComponentCalls = viewComponentCalls(shortName, className);
}

template OViewComponent(string id) {
  const char[] OViewComponent = `
    DViewComponent `~id~`() { return this.components["`~id~`"]; }
    O `~id~`(this O)(DViewComponent newComponent) { 
      _beforeSet`~id.capitalize~`;
      this.components.set("`~id~`", newComponent);
      _afterSet`~id.capitalize~`; 
      return cast(O)this; }
    void _beforeSet`~id.capitalize~`() {}
    void _afterSet`~id.capitalize~`() {}
  `;
}

template OViewComponent(string id, string name) {
  const char[] OViewComponent = `
    DViewComponent `~name~`() { return this.components["`~id~`"]; }
    O `~name~`(this O)(DViewComponent newComponent) { 
      _beforeSet`~name.capitalize~`;
      this.components.set("`~id~`", newComponent); 
      _afterSet`~name.capitalize~`; 
      return cast(O)this; }
    void _beforeSet`~name.capitalize~`() {}
    void _afterSet`~name.capitalize~`() {}
  `;
}

template OViewComponent(string id, string name, string type) {
  const char[] OViewComponent = `
    `~type~` `~name~`() { return cast(`~type~`)this.components["`~id~`"]; }
    O `~name~`(this O)(`~type~` newComponent) { 
      beforeSet`~name.capitalize~`;
      this.components.set("`~id~`", newComponent); 
      afterSet`~name.capitalize~`; 
      return cast(O)this; }
    void beforeSet`~name.capitalize~`() {}
    void afterSet`~name.capitalize~`() {}
  `;
}
