module uim.mvc.views.entities;

import uim.mvc;
@safe:

// View with entities
class DEntitiesView : DView {
  mixin(ViewThis!("EntitiesView"));
  
  // mixin(OProperty!("DEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DEntitiesView~":DEntitiesView("~this.name~")::beforeH5");
    super.beforeH5(options);

    debug writeln("In DEntitiesView -> %s entities".format(this.entities.length));
    this
      .viewComponents()
        .filter!(comp => cast(DEntityViewComponent)comp)
        .each!(comp => (cast(DEntityViewComponent)comp).entities(this.entities));
  }
}
mixin(ViewCalls!("EntitiesView"));
