module uim.mvc.interfaces.pagecontroller;

import uim.mvc;
@safe:

interface IPageController : IController {
  IEntityBase entityBase();
  string[] sessionData();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();

  ILayout layout();
}