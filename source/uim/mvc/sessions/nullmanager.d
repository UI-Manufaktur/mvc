/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.sessions.nullmanager;

import uim.mvc;
@safe:


/* class DNullSessionManager : DSessionManager {
	this() { super(); this.initialize; }

	override bool initialize(IData[string] configSettings = null) {
    super.initialize(configSettings);

    this
      .isNull(true);
  }

	override ISession session(string httpSessionId, STRINGAA options = null) {
		return null; // NullSession;
	}
	override ISession session(STRINGAA options) {
		return null; // NullSession;
	}
}
auto NullSessionManager() { return new DNullSessionManager(); }
 */