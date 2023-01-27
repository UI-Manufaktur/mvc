module uim.mvc.models.model;

@safe:
import uim.mvc;

class DMVCModel : DMVCBase, IMVCModel { 
  mixin(MVCModelThis!("MVCModel"));

  override void initialize() {}

  mixin(OProperty!("DETBBase", "datasource")); 
}
mixin(MVCModelCalls!("MVCModel", "DMVCModel"));

version(test_uim_mvc) { unittest { 
  assert(MVCModel);
  assert(MVCModel.name == "MVCModel");
}} 
