/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.viewcomponent;

import uim.mvc;
@safe:

string viewComponentThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(IViewComponentManager aManager) { this().manager(aManager); }
  `;
}

template ViewComponentThis(string name) {
  const char[] ViewComponentThis = viewComponentThis(name);
}

string viewComponentCalls(string shortName, string className = null) {
  auto clName = className.length > 0 ? className : "D"~shortName;
  return
    mvcObjectCalls(shortName, className)~
    `auto `~shortName~`(IViewComponentManager aManager) { return new `~clName~`(aManager); }`;
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

/*
template ViewComponentThis(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentThis = `
this() { super(); this.name = "`~classShortName~`"; }
this(DView newView) { this().view(newView); }`~
(withEntity ? `
this(DEntity newEntity) { this().entity(newEntity); }
this(DView newView, DEntity newEntity) { this(newView).entity(newEntity); }
` : ``)~
(withEntities ? `
this(DEntity[] newEntities) { this().entities(newEntities); }
this(DView newView, DEntity[] newEntities) { this(newView).entities(newEntities); }
` : ``);

}

template ViewComponentCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewComponentCalls = `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DView newView) { return new D`~classShortName~`(newView); }`~
(withEntity ? `
auto `~classShortName~`(DEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DView newView, DEntity myEntity) { return new D`~classShortName~`(newView, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DEntity[] newEntities) { return new D`~classShortName~`(newEntities); }
auto `~classShortName~`(DView newView, DEntity[] newEntities) { return new D`~classShortName~`(newView, newEntities); }
` : ``);
}


*/