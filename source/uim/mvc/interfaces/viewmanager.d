/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.viewmanager;

import uim.mvc;
@safe:

interface IViewManager {
  IEntityBase entityBase();
  DViewContainer viewContainer();

  void addViews(IView[string] someViews);
  void addViews(IView[] someViews...);
  void addViews(IView[] someViews);
  IView[] views();
  string[] viewNames();

  IView view(string aName);

  void defaultView(IView aView);
  IView defaultView();

  void errorView(IView aView);
  IView errorView();

  bool hasView(IView aView);
  bool hasView(string aName);

  // Add view if not exitst
  void addView(IView aView);
  void addView(string aName, IView aView);

  // Update existing view
  bool updateView(IView aView);
  bool updateView(string aName, IView aView);

  // Remove existing view
  bool removeView(IView aView);
  bool removeView(string aName);
}
