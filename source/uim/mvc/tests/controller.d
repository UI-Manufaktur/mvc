/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.tests.controller;

@safe:
import uim.mvc;

void testController(DController aController, string controllerName) { 
  assert(aController, "Controller "~controllerName~" does not exist");
  assert(aController.name("testName").name == "testName", "Controller "~controllerName~" could not change name");
  assert(aController.parameters(["a":"b"])["a"] == "b", "Controller "~controllerName~" could set parameter 'a'");
  assert(aController.parameter("c", "d")["c"] == "d", "Controller "~controllerName~" could set parameter 'c'");
}