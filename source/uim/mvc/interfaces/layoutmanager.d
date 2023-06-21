module uim.mvc.interfaces.layoutmanager;

import uim.mvc;
@safe:

interface ILayoutManager {
  ILayout[] layouts();
  ILayout layoutByName(string aName);

  void addLayout(ILayout aLayout);
  void addLayout(string aName, ILayout aLayout);

  void updateLayout(string aName, ILayout aLayout);

  void removeLayout(string aName);
}