module uim.mvc.controllers.interface_;

@safe:
import uim.mvc;

interface IController : IMVCBase  {
  string rootPath(); 
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null);
}