module uim.baklava.containers.scripts;

@safe:
import uim.baklava;

class DBKLScriptContainer : DBKLH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Script(a)).array); 
    return cast(O)this;
  }

	O entries(this O)(DH5Script[] newEntries...) { 
    this.entries(newEntries); 
    return cast(O)this;
  }

	O addLinks(this O)(string[] newLinks...) { 
    this.addLinks(newLinks); 
    return cast(O)this;
  }
	
  O addLinks(this O)(string[] newLinks) { 
    this.add(newLinks.map!(link => H5Script(["src":link])).array); 
    return cast(O)this;
  }

	O addContents(this O)(string[] newContents...) { 
    this.addContents(newContents); 
    return cast(O)this;
  }
	
  O addContents(this O)(string[] newContents) { 
    this.add(newContents.map!(content => H5Script(content)).array); 
    return cast(O)this;
  }

	O addLinks(this O)(STRINGAA[] newLinks...) { 
    this.addLinks(newLinks); 
    return cast(O)this;
  }
	
  O addLinks(this O)(STRINGAA[] newLinks) { 
    this.add(newLinks.map!(link => H5Script(link)).array); 
    return cast(O)this;
  }
}
auto BKLScriptContainer() { return new DBKLScriptContainer; }

version(test_uim_BKLs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

/*     assert(new DBKLScriptContainer);
    assert(BKLScriptContainer);
    assert(cast(DBKLScriptContainer)BKLScriptContainer);
    assert(!BKLScriptContainer.entries);
    assert(BKLScriptContainer.entries.add("abc").entries); */
/* 
    assert(BKLScriptContainer.entries.add("abc").entries.length == 1);
    assert(BKLScriptContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(BKLScriptContainer.entries.add(H5Style).entries.length == 1);

    assert(BKLScriptContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(BKLScriptContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(BKLScriptContainer.entries.add(H5Style, H5Style).entries.length == 2);

    assert(BKLScriptContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(BKLScriptContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(BKLScriptContainer.entries.add([H5Style, H5Style]).entries.length == 2); */
  }
}