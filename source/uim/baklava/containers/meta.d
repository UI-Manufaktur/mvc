module uim.baklava.containers.metas;

@safe:
import uim.baklava;

class DMVCMetaContainer : DMVCH5Container {
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
auto MVCMetaContainer() { return new DMVCMetaContainer; }

version(test_uim_MVCs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);
    
/*     assert(new DMVCLinkContainer);
    assert(MVCLinkContainer);
    assert(cast(DMVCLinkContainer)MVCLinkContainer);
    assert(!MVCLinkContainer.entries);
    assert(MVCLinkContainer.entries.add("abc").entries);

    assert(MVCLinkContainer.entries.add("abc").entries.length == 1);
    assert(MVCLinkContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(MVCLinkContainer.entries.add(H5Meta).entries.length == 1);

    assert(MVCLinkContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(MVCLinkContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(MVCLinkContainer.entries.add(H5Meta, H5Meta).entries.length == 2);

    assert(MVCLinkContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(MVCLinkContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(MVCLinkContainer.entries.add([H5Meta, H5Meta]).entries.length == 2); */
  }
}