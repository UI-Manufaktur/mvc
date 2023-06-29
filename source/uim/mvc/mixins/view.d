/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.view;

import uim.mvc;
@safe:

auto viewThis(string name) {
  return 
    mvcObjectThis(name)~
  `
    this(IViewManager aManager) { this(); manager(aManager); }
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
    auto `~shortName~`(IViewManager aManager) { return new `~clName~`(aManager); }
    `;
}

template ViewCalls(string shortName, string className = null) {
  const char[] ViewCalls = viewCalls(shortName, className);
}

/*
string appViewThis(string name, bool withEntity = false, bool withEntities = false) {
  return `
this() { super(); this.name("`~name~`"); }
this(DPageController aManager) { this().controller(aManager); }
this(string myName) { this().name(myName); }
this(DPageController aManager, string myName) { this(aManager).name(myName); }
`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(DPageController aManager, DEntity myEntity) { this(aManager).entity(myEntity); }
` : ``)~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(DPageController aManager, DEntity[] myEntities) { this(aManager).entities(myEntities); }
` : ``);

}

template ViewThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] ViewThis = appViewThis(name, withEntity, withEntities);
}

string appViewCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  return `
auto `~classShortName~`() { return new D`~classShortName~`; }
auto `~classShortName~`(DPageController aManager) { return new D`~classShortName~`(aManager); }
auto `~classShortName~`(string myName) { return new D`~classShortName~`(myName); }
auto `~classShortName~`(DPageController aManager, string myName) { return new D`~classShortName~`(aManager, myName); }`~
(withEntity ? `
auto `~classShortName~`(DEntity myEntity) { return new D`~classShortName~`(myEntity); }
auto `~classShortName~`(DPageController aManager, DEntity myEntity) { return new D`~classShortName~`(aManager, myEntity); }
` : ``)~
(withEntities ? `
auto `~classShortName~`(DEntity[] myEntities) { return new D`~classShortName~`(myEntities); }
auto `~classShortName~`(DPageController aManager, DEntity[] myEntities) { return new D`~classShortName~`(aManager, myEntities); }
` : ``);
}

template ViewCalls(string classShortName, bool withEntity = false, bool withEntities = false) {
  const char[] ViewCalls = appViewCalls(classShortName, withEntity, withEntities);
}

void testView(DView view) {
	assert(view);	

	view["id"] = "testId1";
	assert(view.id == "testId1");	
	assert(view["id"] == "testId1");	

	view.id("testId2");
	assert(view.id("testId2").id == "testId2");	
	assert(view.id("testId2")["id"] == "testId2");	

	view["name"] = "testName1";
	assert(view.name == "testName1");	
	assert(view["name"] == "testName1");	

	view.name("testName2");
	assert(view.name("testName2").name == "testName2");	
	assert(view.name("testName2")["name"] == "testName2");	
}

/* template ViewProperty(string dataType, string name) {
  const char[] ViewProperty = `
  `~dataType~` `~name~`() { return cast(`~dataType~`)this.component("`~name~`"); }
  O `~name~`(this O)(`~dataType~` newComponent) { this.component("`~name~`", newComponent); return cast(O)this; }
  `;
} * /

template ViewProperty(string dataType, string name) {
  const char[] ViewProperty = `
  protected `~dataType~` _`~name~`;
  `~dataType~` `~name~`() { return _`~name~`; }
  O `~name~`(this O)(`~dataType~` newComponent) { _`~name~` = newComponent; return cast(O)this; }
  `;
}
*/