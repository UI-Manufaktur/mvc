module uim.mvc.views.components.forms.crud.entities;

@safe:
import uim.mvc;

class DMVCEntitiesForm : DMVCForm {
  mixin(MVCViewComponentThis!("MVCEntitiesForm"));

  // mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("MVCEntitiesForm", "DMVCEntitiesForm"));
