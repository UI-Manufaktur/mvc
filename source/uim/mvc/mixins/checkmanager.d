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
    size_t countRoutes() {
      return 
        _routes.length;
    }
  // #endregion checks


  void addChecks(ICheck[] someChecks...) {
    this.addChecks(someChecks.dup);
  }

  void addChecks(ICheck[] someChecks) {
    someChecks.each!(check => this.addCheck(check));
  }

  void addCheck(ICheck aCheck) {
    /* debug writeln("void addCheck(ICheck aCheck)"); */
    if (aCheck) {
      if (auto myCheck = cast(DControllerCheck)aCheck) {
        myCheck.manager(this);
      }
      _checks ~= aCheck;
    }
  }
}