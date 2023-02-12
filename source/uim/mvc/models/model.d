module uim.mvc.models.model;

@safe:
import uim.mvc;

class DModel : DMVCBase, IModel { 
  mixin(ModelThis!("Model"));

  override void initialize(DConfig configSettings = null) {}

  mixin(OProperty!("DETBBase", "datasource")); 
}
mixin(ModelCalls!("Model", "DModel"));

version(test_uim_mvc) { unittest { 
  assert(Model);
  assert(Model.name == "Model");
}} 
