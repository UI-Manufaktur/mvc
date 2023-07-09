/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins;

public {
	import uim.mvc.mixins.action;
	import uim.mvc.mixins.authentication;
	import uim.mvc.mixins.base;
	import uim.mvc.mixins.checkmanager;
	import uim.mvc.mixins.command;
	import uim.mvc.mixins.console;
	import uim.mvc.mixins.controller;
	import uim.mvc.mixins.controllercomponent;
	import uim.mvc.mixins.controllercomponentmanager;
	import uim.mvc.mixins.controllermanager;
	import uim.mvc.mixins.entitybase;
	import uim.mvc.mixins.form;
	import uim.mvc.mixins.imports;
	import uim.mvc.mixins.layout;
	import uim.mvc.mixins.layoutmanager;
	import uim.mvc.mixins.model;
	import uim.mvc.mixins.page;
	import uim.mvc.mixins.routemanager;
	import uim.mvc.mixins.router;
	import uim.mvc.mixins.session;
	import uim.mvc.mixins.sessionmanager;
	import uim.mvc.mixins.view;
	import uim.mvc.mixins.viewcomponent;
	import uim.mvc.mixins.viewcomponentmanager;
	import uim.mvc.mixins.viewmanager;
	import uim.mvc.mixins.widget;
}

template MVCParameter(string name) {
  const char[] MVCParameter = `
    O `~name~`(this O)(string value) {
      this.parameter("`~name~`", value);
      return cast(O)this;
    }
    string `~name~`() {
      return this.parameter("`~name~`");
    }
  `;
}

mixin template ImportUimBase() {
  public {
		import uim.core;
		import uim.oop;
		import uim.models;
		import uim.jsonbase;
		import uim.entitybase;
	}
}

template ImportUimMvc() {
  public {
		import  uim.mvc;
		import  uim.mvc.base;
		import  uim.mvc.applications; 
		import  uim.mvc.authentications;
		import  uim.mvc.caches;
		import  uim.mvc.collections;
		import  uim.mvc.commands;
		import  uim.mvc.consoles; 
		import  uim.mvc.containers;
		import  uim.mvc.controllers; 
		import  uim.mvc.helpers;
		import  uim.mvc.entities;
		import  uim.mvc.interfaces;
		import  uim.mvc.javascripts;
		import  uim.mvc.layouts;
		import  uim.mvc.mixins;
		import  uim.mvc.models;
		import  uim.mvc.requests;
		import  uim.mvc.routers;
		import  uim.mvc.routes;
		import  uim.mvc.security;
		import  uim.mvc.sessions; 
		import  uim.mvc.tests;
		import  uim.mvc.views;
	}
}
