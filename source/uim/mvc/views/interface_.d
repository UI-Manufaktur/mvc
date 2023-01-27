module uim.mvc.views.interface_;

@safe:
import uim.mvc;

interface IBKLView : IBKLBase {
  IBKLController controller();
  O controller(this O)(IBKLController newController);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}