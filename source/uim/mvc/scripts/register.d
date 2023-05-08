module uim.mvc.scripts.register;

import uim.mvc;
@safe:

auto registerUser() {
  return 
    jsFunc("registerUser", ["formId"], 
      // Init values
      "let myForm = document.getElementById(formId);"~
      "messages.innerHTML = '';"
    );
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/registeruser.js", "w"); // open for writing
    f.write(registerUser);
}}