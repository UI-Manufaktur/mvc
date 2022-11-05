module uim.baklava.tests.controllercomponent;

@safe:
import uim.baklava;

void testBLVControllerComponent(DBLVControllerComponent aControllerComponent, string controllercomponentName) { 
  assert(aControllerComponent, "ControllerComponent "~controllercomponentName~" does not exist");
  assert(aControllerComponent.name("testName").name == "testName", "ControllerComponent "~controllercomponentName~" could not change name");
  assert(aControllerComponent.parameters(["a":"b"])["a"] == "b", "ControllerComponent "~controllercomponentName~" could set parameter 'a'");
  assert(aControllerComponent.parameter("c", "d")["c"] == "d", "ControllerComponent "~controllercomponentName~" couldn't set parameter 'c'");
  assert(cast(DBLVControllerComponent)BLVControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DBLVControllerComponent");
  assert(cast(IBLVControllerComponent)BLVControllerComponent, "ControllerComponent "~controllercomponentName~" couldn't cast to DBLVControllerComponent");
}