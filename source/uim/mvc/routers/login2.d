module uim.mvc.routers.login2;

@safe:
import uim.mvc;

void uimLogin2Page(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLogin2Page~":uimLogin2Page");

  APPLogin2PageController(thisServer).request(req, res);
}

void uimLogin2Action(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLogin2Action~":uimLogin2Action");

  APPLogin2ActionController(thisServer).request(req, res);
}
