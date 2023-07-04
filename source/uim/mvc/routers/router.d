/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.routers.router;

import uim.mvc;
@safe:

class DRouter {
  // Contains the base string that will be applied to all generated URLs. For example `https://example.com`
  protected static string _fullBaseUrl;

  // Regular expression for action names
  const string ACTION = "index|show|add|create|edit|update|remove|del|delete|view|item";

  // Regular expression for years
  const string YEAR = "[12][0-9]{3}";

  // Regular expression for months
  const string MONTH = "0[1-9]|1[012]";

  // Regular expression for days
  const string DAY = "0[1-9]|[12][0-9]|3[01]";

  // Regular expression for auto increment IDs
  const string ID = "[0-9]+";

  // Regular expression for UUIDs
  const string UUID = "[A-Fa-f0-9]{8}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{4}-[A-Fa-f0-9]{12}";
}
auto Router() { return new DRouter; }