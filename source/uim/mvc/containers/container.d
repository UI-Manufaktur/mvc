/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.containers.container;

import uim.mvc;
@safe:

class DNamedContainer(T) { 
  protected T[string] _items;

  T[] all() { 
    return _items.values;
  }

  T opIndex(string aName) { 
    return _items.get(aName, null);
  }
  void opIndexAssign(T anItem, string aName) { 
    _items[aName] = anItem;
  }

  bool contains(string aName) {
    return (aName in _items ? true : false);
  } 

  void add(string aName, T anItem) {
    _items[aName] = anItem;
  }

  void update(string aName, T anItem) {
    if (aName in _items) _items[aName] = anItem;
  }

  void remove(string aName) {
    _items.remove(aName);
  }
}