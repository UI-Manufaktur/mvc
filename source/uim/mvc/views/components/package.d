/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.components;

public import uim.mvc.views.components.component;
public import uim.mvc.views.components.components;
public import uim.mvc.views.components.interface_;
public import uim.mvc.views.components.registry;

public import uim.mvc.views.components.entity;
public import uim.mvc.views.components.entities;
public import uim.mvc.views.components.null_;
public import uim.mvc.views.components.static_;

public import uim.mvc.views.components.accordions;
public import uim.mvc.views.components.alerts;
public import uim.mvc.views.components.avatars;
public import uim.mvc.views.components.badges;
public import uim.mvc.views.components.breadcrumbs;
public import uim.mvc.views.components.cards;
public import uim.mvc.views.components.entitiesx;
public import uim.mvc.views.components.filters;
public import uim.mvc.views.forms;
public import uim.mvc.views.components.lists;
public import uim.mvc.views.components.navbars;
public import uim.mvc.views.components.pages;
// public import uim.mvc.views.components.panels;
public import uim.mvc.views.components.search;
public import uim.mvc.views.components.tables;
public import uim.mvc.views.components.tabpanes;
public import uim.mvc.views.components.tabs;

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
