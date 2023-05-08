/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.tests.model;

import uim.mvc;
@safe:

void testModel(DModel aModel, string modelName) { 
  assert(aModel, "Model "~modelName~" does not exist");
  assert(aModel.name("testName").name == "testName", "Model "~modelName~" could not change name");
  assert(aModel.parameters(["a":"b"])["a"] == "b", "Model "~modelName~" could set parameter 'a'");
  assert(aModel.parameter("c", "d")["c"] == "d", "Model "~modelName~" could set parameter 'c'");
}