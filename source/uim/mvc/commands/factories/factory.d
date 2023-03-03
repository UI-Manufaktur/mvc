/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.commands.factories.factory;

@safe:
import uim.mvc;

class DCommandFactory /* : ICommandFactory */ {
  this() { initialize; }

  void initialize() {       
  }
  
  /* ICommand create(string name) {
      return null;
  } */
}
auto CommandFactory() { return new DCommandFactory; }

version(test_uim_mvc) { unittest {
  assert(CommandFactory);
}}