module uim.baklava.mixins.base;

@safe:
import uim.baklava;

string mvcBaseThis(string name) {
  return `
    this() { super(); this.name("`~name~`"); }
    this(DBLVApplication myApplication) { this().application(myApplication); }
    this(string myName) { this().name(myName); }
    this(string[string] myParameters) { this().parameters(myParameters); }

    this(DBLVApplication myApplication, string myName) { this(myApplication).name(myName); }
    this(DBLVApplication myApplication, string[string] myParameters) { this(myApplication).parameters(myParameters); }

    this(string myName, string[string] myParameters) { this(name).parameters(myParameters); }
    this(DBLVApplication myApplication, string myName, string[string] myParameters) { this(myApplication, name).parameters(myParameters); }

    override DBLVBase create() {
      return `~name~`;
    }
  `;
}

template BLVBaseThis(string name) {
  const char[] BLVBaseThis = mvcBaseThis(name);
}

string mvcBaseCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DBLVApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DBLVApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DBLVApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BLVBaseCalls(string shortName, string className) {
  const char[] BLVBaseCalls = mvcBaseCalls(shortName, className);
}


