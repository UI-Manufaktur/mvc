/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.caches.clear;

// CacheClear command.
class DCacheClearCommand : DCommand {
  static string defaultName() {
    return "cache clear";
  }

    /**
    * Implement this method with your command"s logic.
    *
    * @param uim.cake.consoles.Arguments someArguments The command arguments.
    * @param uim.cake.consoles.ConsoleIo aConsoleIo The console io
    * @return int|null The exit code or null for success
    */
  int execute(Json someArguments, ConsoleIo aConsoleIo) {
    auto myName = someArguments["engine"].get!string;
    /* TODO: 
	try {
      aConsoleIo.out("Clearing {myName}");

      $engine = Cache::pool(myName);
      Cache::clear(myName);
      if ($engine instanceof ApcuEngine) {
          aConsoleIo.warning("ApcuEngine detected: Cleared {myName} CLI cache successfully " ~
              "but {myName} web cache must be cleared separately.");
      } elseif ($engine instanceof WincacheEngine) {
          aConsoleIo.warning("WincacheEngine detected: Cleared {myName} CLI cache successfully " ~
              "but {myName} web cache must be cleared separately.");
      } else {
          aConsoleIo.out("<success>Cleared {myName} cache</success>");
      }
    } catch (InvalidArgumentException $e) {
        aConsoleIo.error($e.getMessage());
        this.abort();
    } */ 

    return CODE_SUCCESS;
  }
}
auto CacheClearCommand() { return new DCacheClearCommand; }