/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components.forms.components.inputs;

@safe:
import uim.mvc;

// Main
public import uim.mvc.views.components.forms.components.inputs.entity;
public import uim.mvc.views.components.forms.components.inputs.input;
public import uim.mvc.views.components.forms.components.inputs.handler;

// Modules
public import uim.mvc.views.components.forms.components.inputs.checkbox;
public import uim.mvc.views.components.forms.components.inputs.description;
public import uim.mvc.views.components.forms.components.inputs.date;
public import uim.mvc.views.components.forms.components.inputs.display;
public import uim.mvc.views.components.forms.components.inputs.name;
public import uim.mvc.views.components.forms.components.inputs.startenddate;
public import uim.mvc.views.components.forms.components.inputs.switch_;
public import uim.mvc.views.components.forms.components.inputs.text;
public import uim.mvc.views.components.forms.components.inputs.textarea;

// for tests
public import uim.mvc.views.components.forms.components.inputs.tests;

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