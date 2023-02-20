module uim.mvc.requests;

@safe:
import uim.mvc;

class DMVCRequestReader {
  this(DPageController page) {
    _page = page;
  }

  mixin(OProperty!("DPageController", "page"));
  mixin(OProperty!("STRINGAA", "parameters"));

  STRINGAA read(HTTPServerRequest serverRequest, STRINGAA requestParameters) {
    if (page) foreach(k, v; page.parameters) if (k !in requestParameters) requestParameters[k] = v;
    requestParameters["htmlMode"] = to!string(serverRequest.method);
    return requestParameters;
  }
}
auto MVCRequestReader(DPageController page) { return new DMVCRequestReader(page); }

version(test_uim_mvc) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    // TODO Add Tests
}}