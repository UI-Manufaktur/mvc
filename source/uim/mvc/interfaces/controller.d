/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.controller;

import uim.mvc;
@safe:

interface IController : IMVCObject, ICheckManager, IControllerComponentManager {
  IControllerManager manager();
  void manager(IControllerManager aManager);

  string rootPath(); 

  string mimetype();
  string collectionName();
  string entitiesName();
  string language();
  string responseResult();
  string httpMode();
  string stringRequest();
  string method();
  string peer();
  string host();
  string path();
  string rootDir();
  string queryString();
  string fullURL();
  string json();
  string username();
  string password();
  string contentType();
  string contentTypeParameters();
  string timeCreated();
  string persistent();
  string redirectUrl(); // Url in case of an redirect

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null);
}