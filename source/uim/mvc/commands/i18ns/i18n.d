module uim.mvc.commands.i18ns.i18n;

@safe:
import uim.mvc;

class DI18nCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto I18nCommand() { return new DI18nCommand; }

version(test_uim_apps) { unittest {
  assert(I18nCommand);
}}