module uim.mvc.interfaces.registerable;

@safe:
import uim.mvc;

interface IRegisterable {
  // Gets the registerPath
  @property string registerPath();

  // Gets the value of the initialization parameter with the given name that will be used to initialize this object.
  @property Json defaultConfig();
}