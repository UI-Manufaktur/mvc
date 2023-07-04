/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.helpers;

public {
	import  uim.mvc.helpers.controllermanager;
	import  uim.mvc.helpers.inputinterface;
	import  uim.mvc.helpers.outputinterface;
	import  uim.mvc.helpers.router;
	import  uim.mvc.helpers.session;
}

// Default error code
const int CODE_ERROR = 1;

// Default success code
const int CODE_SUCCESS = 0;

@safe:
template AddRoutes(string router, string rootPath, string rootName) {
  const char[] AddRoutes = `
`~router~`
  .get("`~rootPath~`", &`~rootName~`Index)
  .get("`~rootPath~`/", &`~rootName~`Index)
  .get("`~rootPath~`/view", &`~rootName~`View)
  .get("`~rootPath~`/create", &`~rootName~`Create)
  .get("`~rootPath~`/edit", &`~rootName~`Edit)
  .get("`~rootPath~`/delete", &`~rootName~`Delete)
  .get("`~rootPath~`/:entityName", &`~rootName~`Index);

`~router~`
  .post("`~rootPath~`/actions/create", &`~rootName~`CreateAction)
  .post("`~rootPath~`/actions/update", &`~rootName~`UpdateAction)
  .post("`~rootPath~`/actions/delete", &`~rootName~`DeleteAction);
`;
}



template ActionCalls(string rootName, string className, string appName) {
  const char[] ActionCalls = `
void `~rootName~`CreateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`CreateAction~":`~rootName~`CreateAction");

  `~className~`CreateAction(`~appName~`).request(req, res);
}

void `~rootName~`UpdateAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`UpdateAction~":`~rootName~`UpdateAction");

  `~className~`UpdateAction(`~appName~`).request(req, res);
}

void `~rootName~`DeleteAction(HTTPServerRequest req, HTTPServerResponse res) {
  debugMethodCall(moduleName!`~rootName~`DeleteAction~":`~rootName~`DeleteAction");

 `~className~`DeleteAction(`~appName~`).request(req, res);
}
`;
}