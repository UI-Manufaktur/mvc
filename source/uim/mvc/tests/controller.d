module uim.mvc.tests.controller;

@safe:
import uim.mvc;

void testMVCController(DMVCController aController, string controllerName) { 
  assert(aController, "Controller "~controllerName~" does not exist");
}