module uim.mvc.interfaces.layout;

@safe:
import uim.mvc;

interface ILayout {
  string render(DPageController controller, string content, STRINGAA options = null);
}