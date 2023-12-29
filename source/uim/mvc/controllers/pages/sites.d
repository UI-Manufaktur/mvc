/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.sites;

import uim.mvc;

@safe:
class DSitesPage : DPageController {
  mixin(ControllerThis!("SitesPage"));

override void initialize(Json[string] configSettings = null) {
    super.initialize(configSettings);

    this
    .title("Anmeldung (Kennung)")
    .view(ViewSites(this));

    this.scripts.addLinks(
      "/js/apps/app.js",   
      "/js/apps/login.js");

    this.scripts.addContents(`
      window.addEventListener('load', (event) => {
        document.getElementById("loginForm").addEventListener("submit", event => {
          event.preventDefault();
          login("loginForm");
        })
      });`);
    }
  }
mixin(ControllerCalls!("SitesPage"));

version(test_uim_mvc) { unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSitesPage); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SitesPage); 
}}