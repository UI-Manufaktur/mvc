module uim.baklava.views.interface_;

@safe:
import uim.baklava;

interface IBLVView : IBLVBase {
  IBLVController controller();
  O controller(this O)(IBLVController newController);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}