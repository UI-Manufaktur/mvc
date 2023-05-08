module uim.mvc.interfaces.commandfactory;

import uim.mvc;
@safe:

// An interface for abstracting creation of command and shell instances.
interface ICommandFactory {
    //The factory method for creating Command and Shell instances.
    ICommand create(string className); // className = Command/Shell class name.
}
