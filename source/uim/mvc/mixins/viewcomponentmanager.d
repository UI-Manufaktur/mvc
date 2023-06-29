/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.viewcomponentmanager;

import uim.mvc;
@safe:

mixin template ViewComponentManagerTemplate() {
  // #region components
    void components(IViewComponent[] someComponents...) {
      components(someComponents.dup);
    }
  // #endregion components

  // #region addComponents
    void addComponents(IViewComponent[] someComponents...) {
      addComponents(someComponents.dup);
    }
    void addComponents(IViewComponent[] someComponents) {
      _viewComponents ~= someComponents;
    }
  // #endregion addComponents

  void addComponent(IViewComponent aComponent) {
    _viewComponents ~= aComponent;
  }
}