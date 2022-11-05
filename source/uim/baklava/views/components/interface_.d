module uim.baklava.views.components.interface_;

@safe:
import uim.baklava;

interface IBLVViewComponent : IBLVBase {
  IBLVView view();
  O view(this O)(IBLVView newView);

  DH5Obj[] toH5(STRINGAA options = null);
  string render(STRINGAA options = null);
}