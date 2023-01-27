module uim.baklava.mixins.base;

@safe:
import uim.baklava;

string mvcBaseThis(string name) {
  return `
    this() { super(); this.name("`~name~`"); }
    this(DBKLApplication myApplication) { this().application(myApplication); }
    this(string myName) { this().name(myName); }
    this(string[string] myParameters) { this().parameters(myParameters); }

    this(DBKLApplication myApplication, string myName) { this(myApplication).name(myName); }
    this(DBKLApplication myApplication, string[string] myParameters) { this(myApplication).parameters(myParameters); }

    this(string myName, string[string] myParameters) { this(name).parameters(myParameters); }
    this(DBKLApplication myApplication, string myName, string[string] myParameters) { this(myApplication, name).parameters(myParameters); }

    override DBKLBase create() {
      return `~name~`;
    }
  `;
}

template BKLBaseThis(string name) {
  const char[] BKLBaseThis = mvcBaseThis(name);
}

string mvcBaseCalls(string shortName, string className) {
  return `
    auto `~shortName~`() { return new `~className~`; }
    auto `~shortName~`(DBKLApplication myApplication) { return new `~className~`(myApplication); }
    auto `~shortName~`(string myName) { return new `~className~`(myName); }
    auto `~shortName~`(string[string] myParameters) { return new `~className~`(myParameters); }

    auto `~shortName~`(string myName, string[string] myParameters) { return new `~className~`(myName, myParameters); }

    auto `~shortName~`(DBKLApplication myApplication, string myName) { return new `~className~`(myApplication, myName); }
    auto `~shortName~`(DBKLApplication myApplication, string[string] myParameters) { return new `~className~`(myApplication, myParameters); }
  `;
}

template BKLBaseCalls(string shortName, string className) {
  const char[] BKLBaseCalls = mvcBaseCalls(shortName, className);
}


