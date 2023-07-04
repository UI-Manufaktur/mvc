/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.routes;

@safe:
import uim.mvc;

// Provides interactive CLI tools for routing.
class DRoutesCommand : DCommand {
  /**
    * Display all routes in an application
    *
    * @param uim.cake.consoles.Arguments someArguments The command arguments.
    * aConsoleIo - The console io
    * @return int|null The exit code or null for success
    */
  int execute(Arguments someArguments, ConsoleIo aConsoleIo) {
      auto myHeader = ["Route name", "URI template", "Plugin", "Prefix", "Controller", "Action", "Method(s)"];
      if (someArguments.option("verbose")) {
          myHeader ~= "Defaults";
      }

      auto myAvailableRoutes = Router::routes();
      $output = $duplicateRoutesCounter = null;

      foreach (myRoute; myAvailableRoutes) {
        $methods = isSet(myRoute.defaults, "_method") ? (array)myRoute.defaults["_method"] : [""];

        $item = [
          myRoute.options.get("_name", myRoute.name()),
          myRoute.template,
          myRoute.defaults["plugin"] ?? "",
          myRoute.defaults["prefix"] ?? "",
          myRoute.defaults["controller"] ?? "",
          myRoute.defaults["action"] ?? "",
          ($methods.join(", ")),
        ];

        if (someArguments.getOption("verbose")) {
            ksort(myRoute.defaults);
            $item ~= json_encode(myRoute.defaults);
        }

        $output ~= $item;

        foreach (myMethod; $methods) {
            if (!isSet($duplicateRoutesCounter[myRoute.template], $method)) {
                $duplicateRoutesCounter[myRoute.template][myMethod] = 0;
            }

            $duplicateRoutesCounter[myRoute.template][myMethod]++;
        }
      }

      if (someArguments.getOption("sort")) {
        usort($output, function ($a, $b) {
            return strcasecmp($a[0], $b[0]);
        });
      }

      array_unshift($output, $header);

      aConsoleIo.helper("table").output($output);
      aConsoleIo.out();

      $duplicateRoutes = null;

      foreach (myRoute; $availableRoutes) {
        $methods = isSet(myRoute.defaults, "_method") ? (array)myRoute.defaults["_method"] : [""];

        foreach ($method; $methods) {
            if (
                $duplicateRoutesCounter[myRoute.template][$method] > 1 ||
                ($method == "" && count($duplicateRoutesCounter[myRoute.template]) > 1) ||
                ($method != "" && isSet($duplicateRoutesCounter[myRoute.template], ""))
            ) {
            $duplicateRoutes ~= [
                myRoute.options.get("_name", myRoute.name()),
                myRoute.template,
                myRoute.defaults["plugin"] ?? "",
                myRoute.defaults["prefix"] ?? "",
                myRoute.defaults["controller"] ?? "",
                myRoute.defaults["action"] ?? "",
                ($methods.join(", ")),
                ];

                break;
            }
          }
      }

      if ($duplicateRoutes) {
          array_unshift($duplicateRoutes, $header);
          aConsoleIo.warning("The following possible route collisions were detected.");
          aConsoleIo.helper("table").output($duplicateRoutes);
          aConsoleIo.out();
      }

      return CODE_SUCCESS;
  }

  /**
    * Get the option parser.
    *
    * anParser - The option parser to update
    * @return uim.cake.consoles.ConsoleOptionParser
    */
  ConsoleOptionParser buildOptionParser(ConsoleOptionParser anParser) {
      $parser
          .description("Get the list of routes connected in this application.")
          .addOption("sort", [
              "help": "Sorts alphabetically by route name A-Z",
              "short": "s",
              "boolean": true,
          ]);

      return $parser;
  }
}
