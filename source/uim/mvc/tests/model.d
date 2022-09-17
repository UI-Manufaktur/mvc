module uim.mvc.tests.model;

@safe:
import uim.mvc;

void testMVCModel(DMVCModel aModel, string modelName) { 
  assert(aModel, "Model "~modelName~" does not exist");
}