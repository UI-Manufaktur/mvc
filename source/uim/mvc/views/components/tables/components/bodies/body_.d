module uim.mvc.views.components.tables.components.bodies.body_;

@safe:
import uim.mvc;

class DBKLTableBody : DBKLTableComponent {
  mixin(BKLViewComponentThis!("BKLTableBody"));
}
mixin(BKLViewComponentCalls!("BKLTableBody", "DBKLTableBody"));

