module uim.mvc.interfaces.layout;

@safe:
import uim.mvc;

interface ILayout : IMVCObject {
  string layoutStyle();
  string title();
  string language();

  ILayout layout();
  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DMVCScriptContainer scripts();
  DStyleContainer styles();
  
  string render(IPageController controller, string content, STRINGAA options = null);
}