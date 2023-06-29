/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.containers.scripts;

import uim.mvc;

@safe:
class DScriptContainer : DH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Script(a)).array); 
    return cast(O)this;
  }

	O entries(this O)(DH5Script[] newEntries...) { 
    this.entries(newEntries.dup); 
    return cast(O)this;
  }

	O addLinks(this O)(string[] newLinks...) { 
    this.addLinks(newLinks.dup); 
    return cast(O)this;
  }
	
  O addLinks(this O)(string[] newLinks) { 
    this.add(newLinks.map!(l => H5Script(["src":l])).array); 
    return cast(O)this;
  }

	O addContents(this O)(string[] newContents...) { 
    this.addContents(newContents.dup); 
    return cast(O)this;
  }
	
  O addContents(this O)(string[] newContents) { 
    this.add(newContents.map!(c => H5Script(c)).array); 
    return cast(O)this;
  }

	O addLinks(this O)(STRINGAA[] newLinks...) { 
    this.addLinks(newLinks.dup); 
    return cast(O)this;
  }
	
  O addLinks(this O)(STRINGAA[] newLinks) { 
    this.add(newLinks.map!(l => H5Script(l)).array); 
    return cast(O)this;
  }
}
auto ScriptContainer() { return new DScriptContainer; }

version(test_uim_MVCs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

/*     assert(new DScriptContainer);
    assert(ScriptContainer);
    assert(cast(DScriptContainer)ScriptContainer);
    assert(!ScriptContainer.entries);
    assert(ScriptContainer.entries.add("abc").entries); */
/* 
    assert(ScriptContainer.entries.add("abc").entries.length == 1);
    assert(ScriptContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(ScriptContainer.entries.add(H5Style).entries.length == 1);

    assert(ScriptContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(ScriptContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(ScriptContainer.entries.add(H5Style, H5Style).entries.length == 2);

    assert(ScriptContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(ScriptContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(ScriptContainer.entries.add([H5Style, H5Style]).entries.length == 2); */
  }
}