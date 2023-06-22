module uim.mvc.controllers.container;

import uim.mvc;
@safe:

class DControllerContainer  : DNamedContainer!IController {
}
auto ControllerContainer() { return new DControllerContainer; }