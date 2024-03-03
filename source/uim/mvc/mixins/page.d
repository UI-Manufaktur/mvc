module uim.mvc.mixins.page;

import uim.mvc;
@safe:

string pageControllerThis(string controllerName, bool withEntity = false, bool withEntities = false) {
	return `
this() { super(); this.name("`~controllerName~`"); }
this(IApplication myApplication) { this().app(myApplication); }
this(DView myView) { this().view(myView); }
this(IApplication myApplication, DView myView) { this().view(myView); }
`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(IApplication myApplication, DEntity myEntity) { this(myApplication).entity(myEntity); }
this(DView myView, DEntity myEntity) { this(myView).entity(myEntity); }
this(IApplication myApplication, DView myView, DEntity myEntity) { this(myApplication, myView).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(IApplication myApplication, DEntity[] myEntities) { this(myApplication).entities(myEntities); }
this(DView myView, DEntity[] myEntities) { this(myView).entities(myEntities); }
this(IApplication myApplication, DView myView, DEntity[] myEntities) { this(myApplication, myView).entities(myEntities); }
` : ``);
}

template PageControllerThis(string controllerName, bool withEntity = false, bool withEntities = false) {
  const char[] PageControllerThis = pageControllerThis(controllerName, withEntity, withEntities);
}

string pageControllerCalls(string controllerName, bool withEntity = false, bool withEntities = false) {
	return `
auto `~controllerName~`() { return new D`~controllerName~`; }
auto `~controllerName~`(IApplication myApplication) { return new D`~controllerName~`(myApplication); }
auto `~controllerName~`(DView myView) { return new D`~controllerName~`(myView); }
auto `~controllerName~`(IApplication myApplication, DView myView) { return new D`~controllerName~`(myApplication, myView); }
`~
(withEntity ? `
auto `~controllerName~`(DEntity myEntity) { return new D`~controllerName~`(myEntity); }
auto `~controllerName~`(IApplication myApplication, DEntity myEntity) { return new D`~controllerName~`(myApplication, myEntity); }
auto `~controllerName~`(DView myView, DEntity myEntity) { return new D`~controllerName~`(myView, myEntity); }
auto `~controllerName~`is(IApplication myApplication, DView myView, DEntity myEntity) { return new D`~controllerName~`(myApplication, myView, myEntity); }
` : ``)
~
(withEntities ? `
auto `~controllerName~`(DEntity[] myEntities) { return new D`~controllerName~`(myEntities); }
auto `~controllerName~`(IApplication myApplication, DEntity[] myEntities) { return new D`~controllerName~`(myApplication, myEntities); }
auto `~controllerName~`(DView myView, DEntity[] myEntities) { return new D`~controllerName~`(myView, myEntities); }
auto `~controllerName~`(IApplication myApplication, DView myView, DEntity[] myEntities) { return new D`~controllerName~`(myApplication, myView, myEntities); }
` : ``);
}

template PageControllerCalls(string controllerName, bool withEntity = false, bool withEntities = false) {
  const char[] PageControllerCalls = pageControllerCalls(controllerName, withEntity, withEntities); 
}

auto appCreatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`CreatePageController : D`~rootController~`PageController {
      `~pageControllerThis(classesName~`CreatePageController`, true)~`

  override bool initialize(DConfigurationValue configSettings = null) {
    super.initialize(configSettings);
      super.initialize;

      this
        .view(
          `~classesName~`CreateView(this));

      `~addInitialize~`
      }
    }`~
    pageControllerCalls(classesName~`CreatePageController`, true);
}


template APPCreatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] APPCreatePageController = appCreatePageController(classesName, rootController, addInitialize, addBeforeResponse);
}