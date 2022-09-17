module uim.mvc.tests.view;

@safe:
import uim.mvc;

void testMVCView(DMVCView aView, string viewName) { 
  assert(aView, "View "~viewName~" does not exist");
}