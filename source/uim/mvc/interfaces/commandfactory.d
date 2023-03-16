module uim.mvc.interfaces.commandfactory;

@safe:
import uim.mvc;

// An interface for abstracting creation of command and shell instances.
interface ICommandFactory {
    //The factory method for creating Command and Shell instances.
    ICommand create(string className); // className = Command/Shell class name.
}
