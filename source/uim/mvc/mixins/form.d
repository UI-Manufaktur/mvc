module uim.mvc.mixins.form;

import uim.mvc;

@safe:
string formThis(string objName, string className = null) {
  string clName = (className ? className : objName);

  return "
this() { super(); this.name(\""~objName~"\"); this.className(\""~clName~"\"); }
  ";
}

string formCalls() {
  return "
  ";
}