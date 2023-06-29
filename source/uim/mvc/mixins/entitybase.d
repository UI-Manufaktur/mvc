/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.entitybase;

import uim.mvc;
@safe:

mixin template EntityBaseTemplate() {
  protected IEntityBase _entityBase;
  void entityBase(IEntityBase anEntityBase) {
    _entityBase = anEntityBase;
  }
  IEntityBase entityBase() {
    if (_entityBase) return _entityBase;

    return (manager ? manager.entityBase : null);
  }
}