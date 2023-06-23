module uim.mvc.interfaces.pagecontroller;

import uim.mvc;
@safe:

interface IPageController: IController {
  DEntityBase DEntityBase", "entityBase();
  string[] sessionData();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();

  ILayout layout();
}