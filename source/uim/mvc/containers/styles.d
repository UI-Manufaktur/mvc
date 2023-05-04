/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.containers.styles;

@safe:
import uim.mvc;

class DStyleContainer : DH5Container {
	O entries(this O)(STRINGAA[] newEntries) { 
    this.entries(newEntries.map!(a => H5Style(a)).array); 
    return cast(O)this;
  }

  // #region addLinks
    O addLinks(this O)(string[] newLinks...) { 
      this.addLinks(newLinks); 
      return cast(O)this;
    }
    
    O addLinks(this O)(string[] newLinks) { 
      this.addLinks(newLinks.map!(entry => ["rel":"stylesheet", "href":entry]).array); 
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
  // #endregion addLinks

  // #region addContent
    O addContent(this O)(string[] newEntries...) { 
      this.addContent(newEntries); 
      return cast(O)this;
    }
    
    O addContent(this O)(string[] newEntries) { 
      this.add(newEntries.map!(entry => H5Style(entry)).array); 
      return cast(O)this;
    }
  // #endregion addContent
}
auto StyleContainer() { return new DStyleContainer; }

version(test_uim_MVCs) { unittest {
    writeln("--- Test in ", __MODULE__, "/", __LINE__);

/*     assert(new DStyleContainer);
    assert(StyleContainer);
    assert(cast(DStyleContainer)StyleContainer);
    assert(!StyleContainer.entries); */
/*     assert(StyleContainer.entries.add("abc").entries);

    assert(StyleContainer.entries.add("abc").entries.length == 1);
    assert(StyleContainer.entries.add(["src":"abc"]).entries.length == 1);
    assert(StyleContainer.entries.add(H5Style).entries.length == 1);

    assert(StyleContainer.entries.add("abc", "xyz").entries.length == 2);
    assert(StyleContainer.entries.add(["src":"abc"], ["src":"xyz"]).entries.length == 2);
    assert(StyleContainer.entries.add(H5Style, H5Style).entries.length == 2);

    assert(StyleContainer.entries.add(["abc", "xyz"]).entries.length == 2);
    assert(StyleContainer.entries.add([["src":"abc"], ["src":"xyz"]]).entries.length == 2);
    assert(StyleContainer.entries.add([H5Style, H5Style]).entries.length == 2); */
  }
}