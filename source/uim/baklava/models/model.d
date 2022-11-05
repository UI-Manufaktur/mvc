module uim.baklava.models.model;

@safe:
import uim.baklava;

class DBLVModel : DBLVBase, IBLVModel { 
  mixin(BLVModelThis!("BLVModel"));

  override void initialize() {}

  mixin(OProperty!("DETBBase", "datasource")); 
}
mixin(BLVModelCalls!("BLVModel", "DBLVModel"));

version(test_uim_mvc) { unittest { 
  assert(BLVModel);
  assert(BLVModel.name == "BLVModel");
}} 
