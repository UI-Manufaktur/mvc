/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins.checkmanager;

import uim.mvc;

@safe:

// #region CheckManager This
  string checkManagerThis() {
    return "
  this() {}
    ";
  }

  template CheckManagerThis() {
    const char[] CheckManagerThis = checkManagerThis();
  }
// #endregion CheckManager This

// #region CheckManager Calls
  string checkManagerCalls() {
    return "
  auto CheckManager() { return new DCheckManager(); }
    ";
  }

  template CheckManagerCalls() {
    const char[] CheckManagerCalls = checkManagerCalls();
  }
// #endregion CheckManager Calls

mixin template CheckManagerTemplate() {
  // #region checks
    protected ICheck[] _checks;

    ICheck[] checks() {
      return _checks;
    }

    void checks(ICheck[] someChecks...) {
      this.checks(someChecks.dup);
    }

    void checks(ICheck[] someChecks) {
      _checks = someChecks;
    }
  // #endregion checks


  void addChecks(ICheck[] someChecks...) {
    _checks ~= someChecks;
  }

  void addChecks(ICheck[] someChecks) {
    _checks ~= someChecks;
  }

  void addCheck(ICheck aCheck) {
    _checks ~= aCheck;
  }
}