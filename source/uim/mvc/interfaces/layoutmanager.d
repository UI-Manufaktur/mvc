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

  ILayout[] layouts();
  string[] layoutNames();

  // get layout
  ILayout layout(string aName = null);

  // Check existing layout
  bool hasLayout(ILayout aLayout);
  bool hasLayout(string aName);

  void defaultLayout(ILayout aLayout);
  ILayout defaultLayout();

  void errorLayout(ILayout aLayout);
  ILayout errorLayout();

  void addLayouts(ILayout[string] someLayouts);
  void addLayouts(ILayout[] someLayouts...);
  void addLayouts(ILayout[] someLayouts);

  bool addLayout(ILayout aLayout);
  bool addLayout(string aName, ILayout aLayout);

  bool updateLayout(ILayout aLayout);
  bool updateLayout(string aName, ILayout aLayout);

  bool removeLayout(ILayout aLayout);
  bool removeLayout(string aName);
}