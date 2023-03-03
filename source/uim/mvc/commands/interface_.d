/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.commands.interface_;

@safe:
import uim.mvc;

interface ICommand { 
  // Set the name of this command 
  O setName(this O)(string name);

  // Run the command.
  int run(STRINGAA arguments);
}