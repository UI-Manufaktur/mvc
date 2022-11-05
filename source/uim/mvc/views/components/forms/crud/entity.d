module uim.mvc.views.components.forms.crud.entity;

@safe:
import uim.mvc;

class DEntityForm : DForm {
  mixin(MVCViewComponentThis!("EntityForm"));

  mixin(OProperty!("DOOPEntity", "entity"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCViewComponentCalls!("EntityForm"));
