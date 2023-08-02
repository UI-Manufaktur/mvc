/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.invalidparameter;

import uim.mvc;
@safe:
/* use Throwable; */

// Used when a passed parameter or action parameter type declaration is missing or invalid.
class DInvalidParameterException : DException {
	mixin(ExceptionThis!("InvalidParameterException"));
/*   protected STRINGAA _templates = [
    "failed_coercion": "Unable to coerce '%s' to `%s` for `%s` in action %s::%s().",
    "missing_dependency": "Failed to inject dependency from service container for parameter `%s` with type `%s` in action %s::%s().",
    "missing_parameter": "Missing passed parameter for `%s` in action %s::%s().",
    "unsupported_type": "Type declaration for `%s` in action %s::%s() is unsupported.",
  ]; */

  /**
    * Switches message template based on `template` key in message array.
    *
    * @param string|array $message Either the string of the error message, or an array of attributes
    *   that are made available in the view, and sprintf()"d into Exception::_messageTemplate
    * errorCode - The error code
    * @param \Throwable|null $previous the previous exception.
    */
/*   this($message = "", int errorCode = 0, ?Throwable $previous = null) {
      if (is_array($message)) {
        _messageTemplate = _templates[$message["template"]] ?? "";
        unset($message["template"]);
      }
      super($message, errorCode, $previous);
  } */
}
mixin(ExceptionCalls!("InvalidParameterException"));

