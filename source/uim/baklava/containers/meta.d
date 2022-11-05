module uim.baklava.containers.metas;

@safe:
import uim.baklava;

class DBLVMetaContainer : DBLVH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Meta(a)).array); 
    return cast(O)this;
  }

  O add(this O)(STRINGAA[] newEntries...) { 
    this.add(newEntries); 
    return cast(O)this;
  }

  O add(this O)(STRINGAA[] newEntries) { 
    _entries ~= newEntries.map!(entry => cast(DH5Obj)H5Meta(entry)).array; 
    return cast(O)this;
  }
}
auto BLVMetaContainer() { return new DBLVMetaContainer; }

version(test_uim_BLVs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
/*     assert(new DBLVLinkContainer);
    assert(BLVLinkContainer);
    assert(cast(DBLVLinkContainer)BLVLinkContainer);
    assert(!BLVLinkContainer.entries);
    assert(BLVLinkContainer.entries.add("abc").entries);

    assert(BLVLinkContainer.entries.add("abc").entries.length == 1);
    assert(BLVLinkContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(BLVLinkContainer.entries.add(H5Meta).entries.length == 1);

    assert(BLVLinkContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(BLVLinkContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(BLVLinkContainer.entries.add(H5Meta, H5Meta).entries.length == 2);

    assert(BLVLinkContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(BLVLinkContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(BLVLinkContainer.entries.add([H5Meta, H5Meta]).entries.length == 2); */
  }
}