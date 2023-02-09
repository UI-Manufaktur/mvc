module uim.mvc.controllers.components.formprotection;

@safe:
import uim.mvc;

class DFormProtectionControllerComponent : DControllerComponent {
  mixin(ControllerComponentThis!("FormProtectionControllerComponent"));
  
  override void initialize(Json configSetting = Json(null)) {
    super.initialize(configSettings);
  }
}