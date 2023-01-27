module uim.mvc.tests.controllercomponent;

@safe:
import uim.mvc;

void testMVCControllerComponent(DMVCControllerComponent aControllerComponent, string controllercomponentName) { 
  assert(aControllerComponent, "ControllerComponent "~controllercomponentName~" does not exist");
  assert(aControllerComponent.name("testName").name == "testName", "ControllerComponent "~controllercomponentName~" could not change name");
  assert(aControllerComponent.parameters(["a":"b"])["a"] == "b", "ControllerComponent "~controllercomponentName~" could set parameter 'a'");
  assert(aControllerComponent.parameter("c", "d")["c"] == "d", "ControllerComponent "~controllercomponentName~" couldn't set parameter 'c'");
  assert(cast(DMVCControllerComponent)MVCControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DMVCControllerComponent");
  assert(cast(IMVCControllerComponent)MVCControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DMVCControllerComponent");
}