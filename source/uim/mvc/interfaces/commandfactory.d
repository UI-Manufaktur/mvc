/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.commandfactory;

import uim.mvc;

@safe:

// An interface for abstracting creation of command and shell instances.
interface ICommandFactory {
	//The factory method for creating Command and Shell instances.
	ICommand create(string aCommandName); // className = Command/Shell class name.
}
