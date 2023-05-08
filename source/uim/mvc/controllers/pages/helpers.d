/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.controllers.pages.helpers;

import uim.mvc;
@safe:
/* 
void initPages(DH5App app) {
  app.pages("login", LoginPageController);
  app.pages("login2", APPLogin2PageController);
  app.pages("logout", APPLogoutPageController);
  app.pages("lostaccount", APPLostAccountPage);
  app.pages("lostpw", APPLostPWPage);
  app.pages("register", APPRegisterPage);
}

auto initRouter(URLRouter router, DAPPAplication app) {
 	/* router
		.get("/login", &app.loginPage.request)
		.get("/logout", &app.logoutPage.request); * /

  return router;
} */