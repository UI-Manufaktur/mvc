module uim.mvc.interfaces.mvc;

import uim.mvc;

@safe:
interface IMVCObject {
  string name();

  Json defaultConfig();
  Json config();

  void set(string aKey, string aValue);
  string get(string aKey);

  string[string] parameters(); 
  Json toJson();

  string debugInfo();
}