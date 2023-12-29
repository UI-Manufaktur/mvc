/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.commands.factories.factory;

import uim.mvc;

@safe:
class DCommandFactory : ICommandFactory {
  this() {
    initialize;
  }

  override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings);
  }

  ICommand create(string aCommandName) {
    return null;
  }
}

auto CommandFactory() {
  return new DCommandFactory;
}

version (test_uim_mvc) {
  unittest {
    assert(CommandFactory);
  }
}
