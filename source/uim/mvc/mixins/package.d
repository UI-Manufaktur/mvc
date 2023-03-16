/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.mixins;

public import uim.mvc.mixins.action;
public import uim.mvc.mixins.base;
public import uim.mvc.mixins.console;
public import uim.mvc.mixins.controller;
public import uim.mvc.mixins.controllercomponent;
public import uim.mvc.mixins.imports;
public import uim.mvc.mixins.layout;
public import uim.mvc.mixins.model;
public import uim.mvc.mixins.page;
public import uim.mvc.mixins.router;
public import uim.mvc.mixins.view;
public import uim.mvc.mixins.viewcomponent;

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
  public import uim.core;
  public import uim.oop;
  public import uim.models;
  public import uim.jsonbase;
  public import uim.entitybase;
}

template ImportUimMvc() {
  public import uim.mvc;
  public import uim.mvc.base;
  public import uim.mvc.applications; 
  public import uim.mvc.authentications;
  public import uim.mvc.caches;
  public import uim.mvc.collections;
  public import uim.mvc.commands;
  public import uim.mvc.consoles; 
  public import uim.mvc.containers;
  public import uim.mvc.controllers; 
  public import uim.mvc.helpers;
  public import uim.mvc.entities;
  public import uim.mvc.interfaces;
  public import uim.mvc.javascripts;
  public import uim.mvc.layouts;
  public import uim.mvc.mixins;
  public import uim.mvc.models;
  public import uim.mvc.requests;
  public import uim.mvc.routers;
  public import uim.mvc.routes;
  public import uim.mvc.security;
  public import uim.mvc.sessions; 
  public import uim.mvc.tests;
  public import uim.mvc.views;
}
