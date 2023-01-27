module uim.mvc.tests.controllercomponent;

@safe:
import uim.mvc;

void testControllerComponent(DControllerComponent aControllerComponent, string controllercomponentName) { 
  assert(aControllerComponent, "ControllerComponent "~controllercomponentName~" does not exist");
  assert(aControllerComponent.name("testName").name == "testName", "ControllerComponent "~controllercomponentName~" could not change name");
  assert(aControllerComponent.parameters(["a":"b"])["a"] == "b", "ControllerComponent "~controllercomponentName~" could set parameter 'a'");
  assert(aControllerComponent.parameter("c", "d")["c"] == "d", "ControllerComponent "~controllercomponentName~" couldn't set parameter 'c'");
  assert(cast(DControllerComponent)ControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DControllerComponent");
  assert(cast(IControllerComponent)ControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DControllerComponent");
}