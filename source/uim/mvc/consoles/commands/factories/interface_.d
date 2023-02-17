module uim.mvc.consoles.commands.factories.interface_;

@safe:
import uim.mvc;

// An interface for abstracting creation of command and shell instances.
interface IAPPCommandFactory {
    //The factory method for creating Command and Shell instances.
    IAPPCommand create(string className); // className = Command/Shell class name.
}
