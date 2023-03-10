module uim.mvc.interfaces.command;

@safe:
import uim.mvc;

interface ICommand { 
  // Set the name of this command 
  O setName(this O)(string name);

  // Run the command.
  int run(STRINGAA arguments);
}