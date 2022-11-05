module uim.baklava.containers.styles;

@safe:
import uim.baklava;

class DBKLStyleContainer : DBKLH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Style(a)).array); 
    return cast(O)this;
  }

	O addLinks(this O)(string[] newLinks...) { 
    this.addLinks(newLinks); 
    return cast(O)this;
  }
	
  O addLinks(this O)(string[] newLinks) { 
    this.addLinks(newLinks.map!(entry => ["rel":"stylesheet", "href":entry]).array); 
    return cast(O)this;
  }

	O addContent(this O)(string[] newEntries...) { 
    this.addContent(newEntries); 
    return cast(O)this;
  }
	
  O addContent(this O)(string[] newEntries) { 
    this.add(newEntries.map!(entry => H5Style(entry)).array); 
    return cast(O)this;
  }

	O addLinks(this O)(STRINGAA[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }
  O addLinks(this O)(STRINGAA[] newEntries) { 
    this.add(newEntries.map!(entry => H5Link(entry)).array); 
    return cast(O)this;
  }
}
auto BKLStyleContainer() { return new DBKLStyleContainer; }

version(test_uim_BKLs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

/*     assert(new DBKLStyleContainer);
    assert(BKLStyleContainer);
    assert(cast(DBKLStyleContainer)BKLStyleContainer);
    assert(!BKLStyleContainer.entries); */
/*     assert(BKLStyleContainer.entries.add("abc").entries);

    assert(BKLStyleContainer.entries.add("abc").entries.length == 1);
    assert(BKLStyleContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(BKLStyleContainer.entries.add(H5Style).entries.length == 1);

    assert(BKLStyleContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(BKLStyleContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(BKLStyleContainer.entries.add(H5Style, H5Style).entries.length == 2);

    assert(BKLStyleContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(BKLStyleContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(BKLStyleContainer.entries.add([H5Style, H5Style]).entries.length == 2); */
  }
}