module uim.mvc.routers.login;

@safe:
import uim.mvc;

void uimLoginPage(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLoginPage~":uimLoginPage");

  APPLoginPageController(thisServer).request(req, res);
}

void uimLoginAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLoginAction~":uimLoginAction");

  LoginActionController(thisServer).request(req, res);
}