/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.route;

import uim.mvc;

@safe:
string routeThis(string objName, string className = null) {
  string clName = (className.length > 0 ? className : objName);

  return "
this() { super(); this.name(\""~objName~"\"); this.className(\""~clName~"\"); }

this(string aPath) { this().path(aPath); }
this(HTTPMethod aMethod) { this().method(aMethod); }
this(IController aController) { this().controller(aController); }

this(string aPath, HTTPMethod aMethod) { this(aPath).method(aMethod); }
this(string aPath, IController aController) { this(aPath).controller(aController); }
this(HTTPMethod aMethod, IController aController) { this(aMethod).controller(aController); }

this(string aPath, HTTPMethod aMethod, IController aController) { this(aPath, aMethod).controller(aController); }
";
}

template RouteThis(string objName, string className = null) {
  const char[] RouteThis = routeThis(objName, className);
}

string routeCalls(string callName, string className = null) {
  auto clName = (className.length > 0 ? className : "D"~callName);

  return "
auto "~callName~"() { return new "~clName~"; }

auto "~callName~"(string aPath) { return new "~clName~"(aPath); }
auto "~callName~"(HTTPMethod aMethod) { return new "~clName~"(aMethod); }
auto "~callName~"(IController aController) { return new "~clName~"(aController); }

auto "~callName~"(string aPath, HTTPMethod aMethod) { return new "~clName~"(aPath, aMethod); }
auto "~callName~"(string aPath, IController aController) { return new "~clName~"(aPath, aController); }

auto "~callName~"(HTTPMethod aMethod, IController aController) { return new "~clName~"(aMethod, aController); }

auto "~callName~"(string aPath, HTTPMethod aMethod, IController aController) { return new "~clName~"(aPath, aMethod, aController); }
";
}

template RouteCalls(string callName, string className = null) {
  const char[] RouteCalls = routeCalls(callName, className);
}