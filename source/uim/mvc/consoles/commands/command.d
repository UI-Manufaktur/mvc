/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.consoles.commands.command;

@safe:
import uim.mvc;

class DCommand : DMVCObject, ICommand{
	  // Default error code
  const int CODE_ERROR = 1;

  // Default success code
  const int CODE_SUCCESS = 0;

  int run(STRINGAA arguments, DConsoleIo aConsoleIo = null) {
		return 0;
	}
}