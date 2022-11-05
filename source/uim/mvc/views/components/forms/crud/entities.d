module uim.mvc.views.components.forms.crud.entities;

@safe:
import uim.mvc;

class DEntitiesForm : DForm {
  mixin(MVCViewComponentThis!("EntitiesForm"));

  mixin(OProperty!("DOOPEntity[]", "entities"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("EntitiesForm"));
