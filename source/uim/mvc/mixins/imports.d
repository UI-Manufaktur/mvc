/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.imports;

template ImportMVC(string prefix) {
  const char[] ImportMVC = 
  "public {
		import  "~prefix~".controllers;
		import  "~prefix~".forms;
		import  "~prefix~".routes;
		import  "~prefix~".views;
	}";
}