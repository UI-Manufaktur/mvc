module uim.mvc.views.components.entitiesx.entity;

@safe:
import uim.mvc;

class DEntityViewComponent : DViewComponent {
  mixin(ViewComponentThis!("EntityViewComponent")); // , true));

  // mixin(OProperty!("DEntity", "entity"));
} 
mixin(ViewComponentCalls!("EntityViewComponent")); // , true));

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO
  }
} 