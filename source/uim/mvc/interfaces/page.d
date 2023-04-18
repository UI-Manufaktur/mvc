module uim.mvc.interfaces.page;

@safe:
import uim.mvc;

interface IPageController: IController {
  DETBBase database();
  string[] sessionData();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DMVCScriptContainer scripts();
  DStyleContainer styles();
}