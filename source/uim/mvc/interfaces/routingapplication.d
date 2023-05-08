/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.routingapplication;

import uim.mvc;
@safe:

// Interface for applications that use routing.
interface IRoutingApplication {
    /**
     * Define the routes for an application.
     *
     * Use the provided RouteBuilder to define an application"s routing.
     *
     * routesBuilder $routes A route builder to add routes into.
     */
    void routes(DRouteBuilder routeBuilder);
}
