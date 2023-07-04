/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.command;

import uim.mvc;
@safe:


// Describe the interface between a command and the surrounding console libraries.
interface ICommand { 
  /**
    * Set the name this command uses in the collection.
    *
    * Generally invoked by the CommandCollection when the command is added.
    * Required to have at least one space in the name so that the root
    * command can be calculated.
    *
    * aName - The name the command uses in the collection.
    * returns this
    */
  ICommand name(string aName);

  // Run the command.
  int run(STRINGAA arguments, DConsoleIo aConsoleIo = null);
}
