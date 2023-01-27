module uim.baklava.tests.controllercomponent;

@safe:
import uim.baklava;

void testBKLControllerComponent(DBKLControllerComponent aControllerComponent, string controllercomponentName) { 
  assert(aControllerComponent, "ControllerComponent "~controllercomponentName~" does not exist");
  assert(aControllerComponent.name("testName").name == "testName", "ControllerComponent "~controllercomponentName~" could not change name");
  assert(aControllerComponent.parameters(["a":"b"])["a"] == "b", "ControllerComponent "~controllercomponentName~" could set parameter 'a'");
  assert(aControllerComponent.parameter("c", "d")["c"] == "d", "ControllerComponent "~controllercomponentName~" couldn't set parameter 'c'");
  assert(cast(DBKLControllerComponent)BKLControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DBKLControllerComponent");
  assert(cast(IBKLControllerComponent)BKLControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DBKLControllerComponent");
}