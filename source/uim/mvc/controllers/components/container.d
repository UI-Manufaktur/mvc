module uim.mvc.controllers.components.container;

import uim.mvc;
@safe:

class DControllerComponentContainer  : DNamedContainer!IControllerComponent {
}
auto ControllerComponentContainer() { return new DControllerComponentContainer; }