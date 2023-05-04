/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.crud;
/**************************************************/
/* This package contains general page definitions */
/**************************************************/

@safe:
import uim.mvc;

public {
	import  uim.mvc.controllers.pages.crud.create;
	import  uim.mvc.controllers.pages.crud.delete_;
	import  uim.mvc.controllers.pages.crud.crud;
	import  uim.mvc.controllers.pages.crud.list;
	import  uim.mvc.controllers.pages.crud.read;
	import  uim.mvc.controllers.pages.crud.update;