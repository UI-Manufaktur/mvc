module uim.baklava.containers.links;

@safe:
import uim.baklava;

class DBKLLinkContainer : DBKLH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Link(a)).array); 
    return cast(O)this;
  }

	O entries(this O)(DH5Link[] newEntries...) { 
    this.entries(newEntries); 
    return cast(O)this;
  }

	O add(this O)(string[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }
	
  O add(this O)(string[] newEntries) { 
    this.add(newEntries.map!(entry => H5Link(["href":entry])).array); 
    return cast(O)this;
  }

	O add(this O)(STRINGAA[] newEntries...) { 
    _entries ~= newEntries.map!(entry => cast(DH5Obj)H5Link(entry)).array; 
    return cast(O)this;
  }
	
  O add(this O)(STRINGAA[] newEntries) { 
    _entries ~= newEntries.map!(entry => cast(DH5Obj)H5Link(entry)).array; 
    return cast(O)this;
  }
}
auto BKLLinkContainer() { return new DBKLLinkContainer; }

version(test_uim_BKLs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
assert(new DBKLLinkContainer);
    assert(BKLLinkContainer);
    assert(cast(DBKLLinkContainer)BKLLinkContainer);
    assert(!BKLLinkContainer.entries);
    assert(BKLLinkContainer.entries.add("abc").entries);

    assert(BKLLinkContainer.entries.add("abc").entries.length == 1);
    assert(BKLLinkContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(BKLLinkContainer.entries.add(H5Link).entries.length == 1);

    assert(BKLLinkContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(BKLLinkContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(BKLLinkContainer.entries.add(H5Link, H5Link).entries.length == 2);

    assert(BKLLinkContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(BKLLinkContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(BKLLinkContainer.entries.add([H5Link, H5Link]).entries.length == 2); 
  }
}