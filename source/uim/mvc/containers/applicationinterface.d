/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.containers.Applicationinterface;

@safe:
import uim.mvc;

// Interface for Applications that configure and use a dependency injection container.
interface IContainerApplication {
  //Register services to the container
  // Registered services can have instances fetched out of the container using `get()`. 
  // Dependencies and parameters will be resolved based on service definitions.
  void services(IContainer container);

  // Create a new container and register services.
  // This will `register()` services provided by both the Application
  // and any plugins if the Application has plugin support.
  IContainer getContainer();
}
