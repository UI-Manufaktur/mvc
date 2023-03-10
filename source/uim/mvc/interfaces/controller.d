module uim.mvc.interfaces.controller;

@safe:
import uim.mvc;

interface IController : IMVCObject  {
  string rootPath(); 
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null);
}