module uim.mvc.views.components.entitiesx.entities;

@safe:
import uim.mvc;

class DEntitiesViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntitiesViewComponent")); // , false, true));

  // mixin(OProperty!("DEntity[]", "entities"));

  override void beforeH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DView~":DView::beforeH5");
    super.beforeH5(options);
    if (hasError || "redirect" in options) { return; }

    debug writeln(entities ? "has entities" : "no entities");
  }
} 
mixin(ViewComponentCalls!("EntitiesViewComponent")); // , false, true));

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} 