/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.components.auth;

import uim.mvc;
@safe:

class DAuthControllerComponent : DControllerComponent {
  mixin(ControllerComponentThis!("AuthControllerComponent"));

  // The query string key used for remembering the referred page when getting redirected to login.
  const string QUERY_STRING_REDIRECT = "redirect";

  // Constant for 'all'
  const string ALL = "all";
}
auto AuthControllerComponent() { return new DAuthControllerComponent; }

version(test_uim_mvc) { unittest {
  assert(AuthControllerComponent);
}}