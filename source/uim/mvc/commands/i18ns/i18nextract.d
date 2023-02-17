module uim.mvc.commands.i18ns.extract;

@safe:
import uim.mvc;

class DI18nExtractCommand {
  this() { initialize; }

    void initialize() {
    // 
  }
}
auto I18nExtractCommand() { return new DI18nExtractCommand; }

version(test_uim_apps) { unittest {
  assert(I18nExtractCommand);
}}