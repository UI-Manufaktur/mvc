module uim.mvc.interfaces.viewcomponentmanager;

import uim.mvc;
@safe:

interface IViewComponentManager {
  IViewComponent[] components();
  void components(IViewComponent[] someComponents);
  void addComponents(IViewComponent[] someComponents);
  void addComponent(IViewComponent aComponent);
}