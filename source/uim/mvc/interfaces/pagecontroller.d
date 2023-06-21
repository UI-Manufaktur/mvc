module uim.mvc.interfaces.pagecontroller;

import uim.mvc;
@safe:

interface IPageController: IController {
  DETBBase database();
  string[] sessionData();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();

  ILayout layout();
}