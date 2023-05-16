module uim.mvc.interfaces.requesthandler;

import uim.mvc;
@safe:

interface IRequestHandler : IMVCObject {
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse);
  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options);
}