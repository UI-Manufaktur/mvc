module uim.mvc.interfaces.command;

import uim.mvc;
@safe:

interface ICommand { 
  // Run the command.
  int run(STRINGAA arguments, DConsoleIo aConsoleIo = null);
}
