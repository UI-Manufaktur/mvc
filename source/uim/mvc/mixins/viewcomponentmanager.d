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
    protected IViewComponent[] _viewComponents();

    IViewComponent[] components() {
      return _viewComponents;
    }

    void components(IViewComponent[] someComponents...) {
      this.components(someComponents.dup);
    }

    void components(IViewComponent[] someComponents) {
      _viewComponents = someComponents;
    }
  // #endregion components

  // #region addComponents
    void addComponents(IViewComponent[] someComponents...) {
      this.addComponents(someComponents.dup);
    }
    void addComponents(IViewComponent[] someComponents) {
      components(components~someComponents);
    }
  // #endregion addComponents

  void addComponent(IViewComponent aComponent) {
    components(components~aComponent);
  }
}