module uim.mvc.interfaces.collection;

@safe:
import uim.mvc;

// An interface for abstracting creation of command and shell instances.
interface ICommandFactory {
  /**
    * The factory method for creating Command and Shell instances.
    *
    * className - Command/Shell class name.
    * returns command or shell
    */
  ICommand create(string className);
}