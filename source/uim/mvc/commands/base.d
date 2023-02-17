module uim.mvc.commands.base;

@safe:
import uim.mvc;

class DBaseCommand /* : ICommand */ {
  mixin(OProperty!("string", "name"));

  int run(STRINGAA arguments) { return 0; }
}
auto BaseCommand() { return new DBaseCommand; }

version(test_uim_apps) { unittest {
  assert(BaseCommand);
}}