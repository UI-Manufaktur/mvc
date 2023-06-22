module uim.mvc.routes.container;

import uim.mvc;
@safe:

class DRouteContainer : DNamedContainer!IRoute {
}
auto RouteContainer() { return new DRouteContainer; }