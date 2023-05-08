module uim.mvc.interfaces.mvc;

import uim.mvc;
@safe:

interface IMVCObject {
  IApplication application();

  string name();
  Json defaultConfig();
  Json config();

  string[string] parameters(); 
  Json toJson();
}