module uim.mvc.interfaces.storage;

// Describes the methods that any class representing an Auth data storage should comply with.
interface IStorage {
  //Read user record.
  IUser readUser();

  // Write user record.
  void writeUser(IUser user);

  // Delete user record.
  void deleteUser();

  // Get/set redirect URL.
  string redirectUrl();
  void redirectUrl(string anUrl);
}
