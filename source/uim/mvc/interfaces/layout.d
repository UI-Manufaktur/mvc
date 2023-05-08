module uim.mvc.interfaces.layout;

import uim.mvc;
@safe:

interface ILayout : IMVCObject {
  string layoutStyle();
  string title();
  string language();

  ILayout layout();
  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();
  
  string render(IPageController controller, string content, STRINGAA options = null);
}