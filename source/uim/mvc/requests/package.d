/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.requests;

import uim.mvc;

@safe:
class DRequestReader {
  this(IPageController page) {
    _page = page;
  }

  mixin(OProperty!("IPageController", "page"));
  mixin(OProperty!("STRINGAA", "parameters"));

  STRINGAA read(HTTPServerRequest serverRequest, STRINGAA requestParameters = null) {
    if (page) requestParameters = requestParameters.merge(page.parameters, false);
    requestParameters["htmlMode"] = to!string(serverRequest.method);
    return requestParameters;
  }
}
auto RequestReader(IPageController page) { return new DRequestReader(page); }