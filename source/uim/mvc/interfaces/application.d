module uim.mvc.interfaces.application;

@safe:
import uim.mvc;

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