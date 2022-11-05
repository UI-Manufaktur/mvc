module uim.baklava.tests.controller;

@safe:
import uim.baklava;

void testBKLController(DBKLController aController, string controllerName) { 
  assert(aController, "Controller "~controllerName~" does not exist");
  assert(aController.name("testName").name == "testName", "Controller "~controllerName~" could not change name");
  assert(aController.parameters(["a":"b"])["a"] == "b", "Controller "~controllerName~" could set parameter 'a'");
  assert(aController.parameter("c", "d")["c"] == "d", "Controller "~controllerName~" could set parameter 'c'");
}