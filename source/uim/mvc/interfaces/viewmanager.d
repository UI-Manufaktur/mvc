module uim.mvc.interfaces.viewmanager;

import uim.mvc;
@safe:

interface IViewManager {
  void views(DViewContainer aContainer); 
  DViewContainer views();

  void defaultView(IView aView);
  void defaultView();

  void errorView(IView aView);
  IView errorView();

  IView view(string aName);
  void view(string aName, IView aView);

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
