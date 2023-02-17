module uim.mvc.requests;

@safe:
import uim.mvc;

class DMVCRequestReader {
  this(DAPPPageController page) {
    _page = page;
  }

  mixin(OProperty!("DAPPPageController", "page"));
  mixin(OProperty!("STRINGAA", "parameters"));

  STRINGAA read(HTTPServerRequest req, STRINGAA reqParameters) {
    if (page) foreach(k, v; page.parameters) if (k !in reqParameters) reqParameters[k] = v;
    reqParameters["htmlMode"] = to!string(req.method);
    return reqParameters;
  }
}
auto APPRequestReader(DAPPPageController page) { return new DMVCRequestReader(page); }

version(test_uim_apps) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO Add Tests
}}