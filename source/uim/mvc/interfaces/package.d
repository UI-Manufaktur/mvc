/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.interfaces;

@safe:
import uim.mvc;

interface IAPPWithEntities {  
  @property DEntity[] entities();
  // @property O entities(this O)(DEntity[] myEntities);
  @property void entities(DEntity[] myEntities);
}

interface IAPPWithEntity {  
  @property DEntity entity();
  @property O entity(this O)(DEntity myEntity);
}