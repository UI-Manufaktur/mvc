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

version(test_uim_apps) { unittest {
  assert(CommandFactory);
}}