/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
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
