/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.tests.view;

import uim.mvc;
@safe:

void testView(DView aView, string viewName) { 
  assert(aView, "View "~viewName~" does not exist");
  assert(aView.name("testName").name == "testName", "View "~viewName~" could not change name");
  assert(aView.parameters(["a":"b"])["a"] == "b", "View "~viewName~" could set parameter 'a'");
  assert(aView.parameter("c", "d")["c"] == "d", "View "~viewName~" could set parameter 'c'");
}