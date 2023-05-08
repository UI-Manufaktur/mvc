module uim.mvc.interfaces.application;

import uim.mvc;
@safe:

interface IApplication : IMVCObject {
  DETBBase database();
  ILayout layout();
  DRoute[HTTPMethod][string] routes();
  string rootPath();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();
}