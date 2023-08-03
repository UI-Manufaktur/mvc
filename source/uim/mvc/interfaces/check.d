/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.check;

import uim.mvc;
@safe:

interface ICheck { 
/* 	IException exception();
	string redirectUrl(); */

	// Execute check - If something goes wrong -> returns false, else true
	bool execute(STRINGAA options = null);    
}
