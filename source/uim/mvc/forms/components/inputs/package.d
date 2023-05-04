/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.forms.components.inputs;

public { // Main
	import  uim.mvc.forms.components.inputs.entity;
	import  uim.mvc.forms.components.inputs.input;
	import  uim.mvc.forms.components.inputs.handler;
}

public { // Modules
	import  uim.mvc.forms.components.inputs.checkbox;
	import  uim.mvc.forms.components.inputs.description;
	import  uim.mvc.forms.components.inputs.date;
	import  uim.mvc.forms.components.inputs.display;
	import  uim.mvc.forms.components.inputs.name;
	import  uim.mvc.forms.components.inputs.startenddate;
	import  uim.mvc.forms.components.inputs.switch_;
	import  uim.mvc.forms.components.inputs.text;
	import  uim.mvc.forms.components.inputs.textarea;
}

public { // for tests
	import  uim.mvc.forms.components.inputs.tests;
}

// Mixins
template FormInputThis(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormInputThis = `
this() { super(); }
this(DForm myForm) { this().form(myForm); };
`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(DForm myForm, DEntity myEntity) { this(myForm).entity(myEntity); }
this(string myName, DEntity myEntity) { this(myName).entity(myEntity); }
this(DForm myForm, string myName, DEntity myEntity) { this(myForm, myName).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(DForm myForm, DEntity[] myEntities) { this(myForm).entities(myEntities); }
this(string myName, DEntity[] myEntities) { this(myName).entities(myEntities); }
this(DForm myForm, string myName, DEntity[] myEntities) { this(myForm, myName).entities(myEntities); }
` : ``);
}

template FormInputCalls(string name, bool withEntity = false, bool withEntities = false) {
  const char[] FormInputCalls = `
auto `~name~`() { return new D`~name~`; }
auto `~name~`(DForm myForm) { return new D`~name~`(myForm); };
`~
(withEntity ? `
this(DEntity myEntity) { this().entity(myEntity); }
this(DForm myForm, DEntity myEntity) { this(myForm).entity(myEntity); }
this(string myName, DEntity myEntity) { this(myName).entity(myEntity); }
this(DForm myForm, string myName, DEntity myEntity) { this(myForm, myName).entity(myEntity); }
` : ``)
~
(withEntities ? `
this(DEntity[] myEntities) { this().entities(myEntities); }
this(DForm myForm, DEntity[] myEntities) { this(myForm).entities(myEntities); }
this(string myName, DEntity[] myEntities) { this(myName).entities(myEntities); }
this(DForm myForm, string myName, DEntity[] myEntities) { this(myForm, myName).entities(myEntities); }
` : ``);
}