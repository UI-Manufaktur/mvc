/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.interfaces;

public {
  import uim.mvc.interfaces.application;
  import uim.mvc.interfaces.authentication;
  import uim.mvc.interfaces.command;
  import uim.mvc.interfaces.container;
  import uim.mvc.interfaces.controller;
  import uim.mvc.interfaces.controllercomponent;
  import uim.mvc.interfaces.form;
  import uim.mvc.interfaces.layout;
  import uim.mvc.interfaces.model;
  import uim.mvc.interfaces.mvc;
  import uim.mvc.interfaces.pagecontroller;
  import uim.mvc.interfaces.route;
  import uim.mvc.interfaces.view;
}
/* interface IAPPWithEntities {  
  @property DEntity[] entities();
  // @property O entities(this O)(DEntity[] myEntities);
  @property void entities(DEntity[] myEntities);
}

interface IAPPWithEntity {  
  @property DEntity entity();
  @property O entity(this O)(DEntity myEntity);
} */