module uim.mvc.views.components.interface_;

@safe:
import uim.mvc;

interface IMVCViewComponent : IMVCBase {
  DMVCView view();
  O view(this O)(DMVCView newView);
}