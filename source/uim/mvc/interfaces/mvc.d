module uim.mvc.interfaces.mvc;

import uim.mvc;
@safe:

interface IMVCObject {
  string name();
  void name(string aName);

  Json defaultConfig();
  Json config();

  string[string] parameters(); 
  Json toJson();

  string debugInfo();
}