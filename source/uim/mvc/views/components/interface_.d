module uim.mvc.views.components.interface_;

@safe:
import uim.mvc;

interface IMVCViewComponent : IMVCBase {
  IMVCView view();
  O view(this O)(IMVCView newView);
}