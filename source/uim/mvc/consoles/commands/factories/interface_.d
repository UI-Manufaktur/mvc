/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.consoles.commands.factories.interface_;

@safe:
import uim.mvc;

// An interface for abstracting creation of command and shell instances.
interface IAPPCommandFactory {
    //The factory method for creating Command and Shell instances.
    IAPPCommand create(string className); // className = Command/Shell class name.
}
