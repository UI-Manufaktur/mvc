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