module uim.mvc.models.model;

@safe:
import uim.mvc;

class DBKLModel : DBKLBase, IBKLModel { 
  mixin(BKLModelThis!("BKLModel"));

  override void initialize() {}

  mixin(OProperty!("DETBBase", "datasource")); 
}
mixin(BKLModelCalls!("BKLModel", "DBKLModel"));

version(test_uim_mvc) { unittest { 
  assert(BKLModel);
  assert(BKLModel.name == "BKLModel");
}} 
