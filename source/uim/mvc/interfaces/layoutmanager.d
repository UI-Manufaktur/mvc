/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.layoutmanager;

import uim.mvc;
@safe:

interface ILayoutManager {
  void layoutContainer(DLayoutContainer aContainer);
  DLayoutContainer layoutContainer();

  void layouts(ILayout[string] someLayouts);
  void layouts(ILayout[] someLayouts);
  ILayout[] layouts();
  string[] layoutNames();

  // set & get layout
  ILayout layout(string aName);
  void layout(ILayout aLayout);
  void layout(string aName, ILayout aLayout);

  // Check existing layout
  bool hasLayout(ILayout aLayout);
  bool hasLayout(string aName);

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