module uim.mvc.interfaces.mvc;

import uim.mvc;

@safe:
interface IMVCObject {
  string name();
  string registerPath();

  Json defaultConfig();
  Json config();

  void set(string aKey, string aValue);
  string get(string aKey);

  STRINGAA parameters(); 
  Json toJson();

  string debugInfo();
}