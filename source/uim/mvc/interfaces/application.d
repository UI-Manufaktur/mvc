/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.application;

import uim.mvc;
@safe:

interface IApplication : IMVCObject {
  DEntityBase DEntityBase", "entityBase();
  ILayout layout();
  DRoute[HTTPMethod][string] routes();
  string rootPath();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();
}