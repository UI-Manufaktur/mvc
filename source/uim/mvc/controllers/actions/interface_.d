module uim.mvc.controllers.actions.interface_;

@safe:
import uim.mvc;

interface IActionController : IController {
  string nextUrl();
  string redirectUrl();

  void beforeResponse(STRINGAA reqParameters);
  void request(HTTPServerRequest req, HTTPServerResponse res, STRINGAA reqParameters);
}