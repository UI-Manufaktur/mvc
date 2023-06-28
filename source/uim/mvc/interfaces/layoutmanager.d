/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.layoutmanager;

import uim.mvc;
@safe:

interface ILayoutManager {
  void layouts(DLayoutContainer aContainer);
  DLayoutContainer layouts();

  void defaultLayout(ILayout aLayout);
  void defaultLayout(string aName, ILayout aLayout);

  void defaultLayoutName(string aName);
  string defaultLayoutName();

  ILayout defaultLayout();

  ILayout layout(string aName = null);

  void addLayouts(ILayout[] someLayouts...);
  void addLayouts(ILayout[] someLayouts);

  void addLayouts(ILayout[string] someLayouts);

  void addLayout(ILayout aLayout);
  void addLayout(string aName, ILayout aLayout);

  void updateLayout(string aName, ILayout aLayout);

  void removeLayout(string aName);
}