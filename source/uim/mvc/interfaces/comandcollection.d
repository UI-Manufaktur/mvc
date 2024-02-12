/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.comandcollection;

import uim.mvc;
@safe:

// An interface for shells that take a CommandCollection during initialization.
interface ICommandCollectionAware {
    /**
     * Set the command collection being used.
     * @param uim.cake.consoles.CommandCollection commands The commands to use.
     */
    /* void commandCollection(CommandCollection someCommands); */
}
