/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.layout;

import uim.mvc;
@safe:

interface ILayout : IMVCObject {
  ILayoutManager manager();
  void manager(ILayoutManager aManager);

  string layoutStyle();
  string title();
  string language();

  DMVCLinkContainer links();
  DMVCMetaContainer metas();
  DScriptContainer scripts();
  DStyleContainer styles();
  
  string render(IPageController controller, string content, STRINGAA options = null);
}