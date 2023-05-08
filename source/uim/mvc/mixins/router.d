module uim.mvc.mixins.router;

import uim.mvc;
@safe:

template RouterFunction(string functionName, string controllerName, string appName, string content = "") {
  const char[] RouterFunction = `
void `~functionName~`(HTTPServerRequest req, HTTPServerResponse res) {
	debugMethodCall("`~functionName~`::request(req, res)");
  `~content~`
  `~controllerName~`(`~appName~`).request(req, res);
}
`;
}