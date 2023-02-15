module uim.mvc.models.model;

@safe:
import uim.mvc;

class DModel : DMVCObject, IModel { 
  mixin(ModelThis!("Model"));

  override void initialize(DConfigurationValue configSettings = null) {}

  mixin(OProperty!("DETBBase", "datasource")); 
}
mixin(ModelCalls!("Model", "DModel"));

version(test_uim_mvc) { unittest { 
  assert(Model);
  assert(Model.name == "Model");
}} 
