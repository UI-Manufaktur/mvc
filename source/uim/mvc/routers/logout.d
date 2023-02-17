module uim.mvc.routers.logout;

@safe:
import uim.mvc;

void uimLogout(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!uimLogout~":uimLogout");

  APPLogoutPageController(thisServer).request(req, res);
}