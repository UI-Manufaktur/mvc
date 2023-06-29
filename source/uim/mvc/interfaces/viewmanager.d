/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.viewmanager;

import uim.mvc;
@safe:

interface IViewManager {
  void views(IView[string] someViews);
  void views(IView[] someViews);
  IView[] views();
  string[] viewNames();

  IView view(string aName);
  void view(string aName, IView aView);

  void defaultView(IView aView);
  IView defaultView();

  void errorView(IView aView);
  IView errorView();

  bool existsView(string aName);

  // Add view if not exitst
  void addView(IView aView);
  void addView(string aName, IView aView);

  // Update existing view
  void updateView(IView aView);
  void updateView(string aName, IView aView);

  // Remove existing view
  void removeView(IView aView);
  void removeView(string aName);
}
