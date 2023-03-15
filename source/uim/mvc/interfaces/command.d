module uim.mvc.interfaces.command;

@safe:
import uim.mvc;

interface ICommand { 
  // Default error code
  const int CODE_ERROR = 1;

  // Default success code
  const int CODE_SUCCESS = 0;

  // Set the name of this command 
  O setName(this O)(string name);

  // Run the command.
  int run(STRINGAA arguments, DConsoleIo aConsoleIo = null);
}