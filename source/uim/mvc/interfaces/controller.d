module uim.mvc.interfaces.controller;

@safe:
import uim.mvc;

interface IController : IMVCObject  {
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
  string redirect();

  void request(HTTPServerRequest newRequest, HTTPServerResponse newResponse, string[string] options = null);
}