/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.caches.clearall;

// CacheClearall command.
class CacheClearallCommand : DCommand {
  //  Get the command name.
  static string defaultName() {
    return "cache clear_all";
  }

  /**
    * Hook method for defining this command"s option parser.
    *
    * @see https://book.cakephp.org/4/en/console-commands/option-parsers.html
    * anParser - The parser to be defined
    * @return uim.cake.consoles.ConsoleOptionParser The built parser.
    */
  ConsoleOptionParser buildOptionParser(ConsoleOptionParser anParser) {
    auto myParser = super.buildOptionParser(anParser);
    myParser.description("Clear all data in all configured cache engines.");

    return myParser;
  }

  /**
    * Implement this method with your command"s logic.
    *
    * @param uim.cake.consoles.Arguments someArguments The command arguments.
    * @param uim.cake.consoles.ConsoleIo aConsoleIo The console io
    * @return int|null The exit code or null for success
    */
  int execute(Arguments someArguments, ConsoleIo aConsoleIo) {
    auto myEngines = Cache::configured();
    foreach (myEngine; myEngines) {
        this.executeCommand(CacheClearCommand, [myEngine], aConsoleIo);
    }

    return CODE_SUCCESS;
  }
}