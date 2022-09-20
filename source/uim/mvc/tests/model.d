module uim.mvc.tests.model;

@safe:
import uim.mvc;

void testMVCModel(DMVCModel aModel, string modelName) { 
  assert(aModel, "Model "~modelName~" does not exist");
  assert(aModel.name("testName").name == "testName", "Model "~modelName~" could not change name");
  assert(aModel.parameters(["a":"b"])["a"] == "b", "Model "~modelName~" could set parameter 'a'");
  assert(aModel.parameter("c", "d")["c"] == "d", "Model "~modelName~" could set parameter 'c'");
}