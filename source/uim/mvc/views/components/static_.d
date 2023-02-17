module uim.mvc.views.components.static_;

@safe:
import uim.mvc;

class DStaticViewComponent : DViewComponent {
  mixin(ViewComponentThis!("StaticViewComponent"));

  mixin(OProperty!("DH5Obj[]", "h5"));

  override DH5Obj[] toH5(STRINGAA options) {
    return this.h5;
  }
}
mixin(ViewComponentCalls!("StaticViewComponent", "DStaticViewComponent"));
