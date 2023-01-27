module uim.mvc.controllers.components.auth;

@safe:
import uim.mvc;

class DAuthControllerComponent : DControllerComponent {
  mixin(ControllerComponentThis!("AuthControllerComponent"));

  // The query string key used for remembering the referred page when getting redirected to login.
  const string QUERY_STRING_REDIRECT = 'redirect';

  // Constant for 'all'
  const string ALL = 'all';
}