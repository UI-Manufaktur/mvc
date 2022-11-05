module uim.baklava.tests.viewcomponent;

@safe:
import uim.baklava;

void testBLVViewComponent(DBLVViewComponent aViewComponent, string viewcomponentName) { 
  assert(aViewComponent, "ViewComponent "~viewcomponentName~" does not exist");
  assert(aViewComponent.name("testName").name == "testName", "ViewComponent "~viewcomponentName~" could not change name");
  assert(aViewComponent.parameters(["a":"b"])["a"] == "b", "ViewComponent "~viewcomponentName~" could set parameter 'a'");
  assert(aViewComponent.parameter("c", "d")["c"] == "d", "ViewComponent "~viewcomponentName~" could set parameter 'c'");
  assert(cast(DBLVViewComponent)BLVViewComponent, "ViewComponent "~viewcomponentName~" couldn't cast to DBLVViewComponent");
  assert(cast(IBLVViewComponent)BLVViewComponent, "ViewComponent "~viewcomponentName~" couldn't cast to DBLVViewComponent");
}