module uim.baklava.views.components.forms.crud.entities;

@safe:
import uim.baklava;

class DMVCEntitiesForm : DMVCForm {
  mixin(MVCViewComponentThis!("MVCEntitiesForm"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCEntitiesForm", "DMVCEntitiesForm"));
