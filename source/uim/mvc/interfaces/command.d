module uim.mvc.interfaces.command;

@safe:
import uim.mvc;

interface ICommand { 
  // Run the command.
  int run(STRINGAA arguments, DConsoleIo aConsoleIo = null);
}
