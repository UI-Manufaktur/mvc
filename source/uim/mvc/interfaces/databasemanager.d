/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.databasemanager;

import uim.mvc;
@safe:

interface IDatabaseManager {
  void databases(DDatabaseContainer aContainer);
  DDatabaseContainer databases();

  void defaultDatabase(IDatabase aDatabase);
  void defaultDatabase(string aName, IDatabase aDatabase);

  void defaultDatabaseName(string aName);
  string defaultDatabaseName();

  IDatabase defaultDatabase();

  IDatabase database(string aName = null);

  void addDatabases(IDatabase[] someDatabases...);
  void addDatabases(IDatabase[] someDatabases);

  void addDatabases(IDatabase[string] someDatabases);

  void addDatabase(IDatabase aDatabase);
  void addDatabase(string aName, IDatabase aDatabase);

  void updateDatabase(string aName, IDatabase aDatabase);

  void removeDatabase(string aName);
}