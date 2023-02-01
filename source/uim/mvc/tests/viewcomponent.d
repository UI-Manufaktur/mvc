module uim.mvc.tests.viewcomponent;

@safe:
import uim.mvc;

void testViewComponent(DViewComponent aViewComponent, string viewcomponentName) { 
  assert(aViewComponent, "ViewComponent "~viewcomponentName~" does not exist");
  assert(aViewComponent.name("testName").name == "testName", "ViewComponent "~viewcomponentName~" could not change name");
  assert(aViewComponent.parameters(["a":"b"])["a"] == "b", "ViewComponent "~viewcomponentName~" could set parameter 'a'");
  assert(aViewComponent.parameter("c", "d")["c"] == "d", "ViewComponent "~viewcomponentName~" could set parameter 'c'");
  assert(cast(DViewComponent)ViewComponent, "ViewComponent "~viewcomponentName~" couldn't cast to DViewComponent");
  assert(cast(IViewComponent)ViewComponent, "ViewComponent "~viewcomponentName~" couldn't cast to DViewComponent");
}