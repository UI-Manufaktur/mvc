module uim.mvc.controllers.components.formprotection;

@safe:
import uim.mvc;

class DFormProtectionControllerComponent : DControllerComponent {
  mixin(ControllerComponentThis!("FormProtectionControllerComponent"));
  
  override void initialize(DConfig configSetting = null) {
    super.initialize(configSettings);
  }
}