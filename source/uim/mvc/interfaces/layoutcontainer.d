module uim.mvc.interfaces.layoutcontainer;

import uim.mvc;
@safe:

interface ILayoutContainer {
  string[] names();
  ILayout[] all();
  ILayout layoutByName(string aName);

  ILayoutContainer add(ILayout aLayout);
  ILayoutContainer add(string aName, ILayout aLayout);

  ILayoutContainer update(string aName, ILayout aLayout);

  ILayoutContainer remove(string aName);
}