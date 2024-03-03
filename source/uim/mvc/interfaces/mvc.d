module uim.mvc.interfaces.mvc;

import uim.mvc;

@safe:
interface IMVCObject {
  string name();
  string registerPath();

  Json defaultConfig();
  IData[string] configSettings = null();

  void set(string aKey, string aValue);
  string get(string aKey);

  STRINGAA parameters(); 
  Json toJson();

  string debugInfo();
}