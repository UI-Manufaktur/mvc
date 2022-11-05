module uim.baklava.controllers.interface_;

@safe:
import uim.baklava;

interface IBLVController : IBLVBase  {
  string rootPath(); 
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null);
}