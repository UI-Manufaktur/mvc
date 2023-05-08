module uim.mvc.scripts.lostaccount;

import uim.mvc;
@safe:

auto lostAccount() {
  string result;

  result ~= jsFunc("lostAccount", ["formId"],       
    // Init values
    "let myForm = document.getElementById(formId);"~
    "messages.innerHTML = '';");

  return result;
}

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
    auto f = File("../../PUBLIC/js/apps/lostaccount.js", "w"); // open for writing
    f.write(lostAccount);
}}