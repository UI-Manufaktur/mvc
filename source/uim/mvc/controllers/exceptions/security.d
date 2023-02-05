/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.controllers.exceptions.security;

@safe:
import uim.mvc;

// Security exception - used when SecurityComponent detects any issue with the current request
class SecurityException : BadRequestException {
  // Security Exception type
  protected string _type = "secure";

  // Reason for request blackhole
  mixin(OProperty!("string", "reason"));

  // Getter for type
  string getType() {
    return _type;
  }

  // Set Message
  void setMessage(string aMessage) {
    this.message = aMessage;
  }
}
