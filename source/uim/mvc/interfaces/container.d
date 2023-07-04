/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.container;

import uim.mvc;
@safe:

/**
 * Interface for the Dependency Injection Container in UIM applications
 *
 * This interface : the PSR-11 container interface and adds
 * methods to add services and service providers to the container.
 *
 * The methods defined in this interface use the conventions provided
 * by league/container as that is the library that UIM uses.
 */
interface IContainer : IMVCObject {}