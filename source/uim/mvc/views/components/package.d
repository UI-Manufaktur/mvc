/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.views.components;

public {
	import  uim.mvc.views.components.component;
	import  uim.mvc.views.components.components;
	import  uim.mvc.views.components.registry;
	import  uim.mvc.views.components.entity;
	import  uim.mvc.views.components.entities;
	import  uim.mvc.views.components.null_;
	import  uim.mvc.views.components.static_;
	import  uim.mvc.views.components.accordions;
	import  uim.mvc.views.components.alerts;
	import  uim.mvc.views.components.avatars;
	import  uim.mvc.views.components.badges;
	import  uim.mvc.views.components.breadcrumbs;
	import  uim.mvc.views.components.cards;
	import  uim.mvc.views.components.entitiesx;
	import  uim.mvc.views.components.filters;
	import  uim.mvc.views.forms;
	import  uim.mvc.views.components.lists;
	import  uim.mvc.views.components.navbars;
	import  uim.mvc.views.components.pages;
	import  uim.mvc.views.components.panels;
	import  uim.mvc.views.components.search;
	import  uim.mvc.views.components.tables;
	import  uim.mvc.views.components.tabpanes;
	import  uim.mvc.views.components.tabs;
}

DH5Obj viewEntities(uint initValue = 10) {
  return H5Div(["text-muted"], 
    H5String("Anzeige "),
    H5Div(["mx-2 d-inline-block"], 
      BS5InputNumber("viewEntities", ["form-control-sm"], ["aria-label":"Entities count", "size":"3", "min":"0"]).value(initValue)
    ),
    H5Div("Einträge"));
}

enum BreadcrumbsStyle = "text-small mb-1"; // Original = "page-pretitle"

Flag!"WithEntity" WithEntity;
Flag!"WithEntities" WithEntities;
