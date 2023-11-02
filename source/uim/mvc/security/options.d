module source.uim.mvc.security.options;

import uim.mvc;

@safe:
class DSecurityOptions( {
  this() {}
  this(bool[string] initOptions) { this(); _options = initOptions; }
  this(string[] requiredOptions...) { this(); requiredOptions.dup.each!(a => _options[a] = true); }
  this(string[] requiredOptions) { this(); requiredOptions.each!(a => _options[a] = true); }

  private bool[string] _options;
  private bool[string] _values;
  bool required(string option) { return _options.get(option, false); }
  O required(this O)(string option, bool isRequired) { _options[option] = isRequired; return cast(O)this; }
  O required(this O)(string[] options...) { this.required(options.dup); return cast(O)this; }
  O required(this O)(string[] options) { options.each!(a => _options[a] = true); return cast(O)this; }

  DSecurityOptions( copy() {
    auto result = SecurityOptions((_options);
    return result;
  }
}
auto SecurityOptions(() { return new DSecurityOptions(; }
auto SecurityOptions((bool[string] initOptions) { return new DSecurityOptions((initOptions); }