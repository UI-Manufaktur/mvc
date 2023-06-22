module uim.mvc.views.container;

import uim.mvc;
@safe:

class DViewContainer : DNamedContainer!IView {
}
auto ViewContainer() { return new DViewContainer; }