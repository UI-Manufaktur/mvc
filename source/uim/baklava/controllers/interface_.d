module uim.baklava.controllers.interface_;

@safe:
import uim.baklava;

interface IBKLController : IBKLBase  {
  string rootPath(); 
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null);
}