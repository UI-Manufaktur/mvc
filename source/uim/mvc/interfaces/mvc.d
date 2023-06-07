module uim.mvc.interfaces.mvc;

import uim.mvc;
@safe:

interface IMVCObject {
  string name();
  Json defaultConfig();
  Json config();

  string[string] parameters(); 
  Json toJson();
}