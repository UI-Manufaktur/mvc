module uim.mvc.interfaces.mvc;

@safe:
import uim.mvc;

interface IMVCObject {
  IApplication application();

  string name();
  Json defaultConfig();
  Json config();

  string[string] parameters(); 
  Json toJson();
}