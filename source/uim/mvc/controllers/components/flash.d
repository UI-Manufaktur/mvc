module uim.mvc.controllers.components.flash;

@safe:
import uim.mvc;

/**
 * The UIM FlashComponent provides a way for you to write a flash variable
 * to the session from your controllers, to be rendered in a view with the FlashHelper.
 *
 * @method void success(string $message, STRINGAA someOptions = null) Set a message using "success" element
 * @method void info(string $message, STRINGAA someOptions = null) Set a message using "info" element
 * @method void warning(string $message, STRINGAA someOptions = null) Set a message using "warning" element
 * @method void error(string $message, STRINGAA someOptions = null) Set a message using "error" element
 */
class FlashComponent : DControllerComponent {
  mixin(ControllerComponentThis!("FlashControllerComponent"));
  
  override void initialize(Json configSetting = Json(null)) {
    super.initialize;

    // Default configuration
    _defaultConfig["key"]= "flash";
    _defaultConfig["element"]= "default";
    _defaultConfig["params"]= [];
    _defaultConfig["clear"]= false;
    _defaultConfig["duplicate"]= true;
  }
}