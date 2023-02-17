module uim.mvc.views.components.lists.items.item;

@safe:
import uim.mvc;

class DListItem : DEntityViewComponent {
  mixin(ViewComponentThis!("ListItem"));
}
mixin(ViewComponentCalls!("ListItem"));
