module source.uim.mvc.consoles.inputargument;

import uim.mvc;

@safe:
/**
 * An object to represent a single argument used in the command line.
 * ConsoleOptionParser creates these when you use addArgument()
 */
class DConsoleInputArgument {
  // Help string
  protected string _help;

  // Is this option required?
  protected bool _required;
  
  // Check if this argument is a required argument
  bool isRequired() {
    return _required;
  }

  // Array of valid choices for this argument.
  protected string[] _choices;

  // Name of the argument.
  protected string _name;
  // Get the value of the name attribute.
  string name() {
    return _name;
  }
}