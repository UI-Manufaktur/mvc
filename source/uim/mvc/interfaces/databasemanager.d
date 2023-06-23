/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.DEntityBase", "entityBasemanager;

import uim.mvc;
@safe:

interface IEntityBaseManager {
  void DEntityBase", "entityBases(DDatabaseContainer aContainer);
  DDatabaseContainer DEntityBase", "entityBases();

  void defaultDatabase(IEntityBase aDatabase);
  void defaultDatabase(string aName, IEntityBase aDatabase);

  void defaultDatabaseName(string aName);
  string defaultDatabaseName();

  IEntityBase defaultDatabase();

  IEntityBase DEntityBase", "entityBase(string aName = null);

  void addDatabases(IEntityBase[] someDatabases...);
  void addDatabases(IEntityBase[] someDatabases);

  void addDatabases(IEntityBase[string] someDatabases);

  void addDatabase(IEntityBase aDatabase);
  void addDatabase(string aName, IEntityBase aDatabase);

  void updateDatabase(string aName, IEntityBase aDatabase);

  void removeDatabase(string aName);
}