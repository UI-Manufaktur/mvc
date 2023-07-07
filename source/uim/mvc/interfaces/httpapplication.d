module source.uim.mvc.interfaces.httpapplication;

// An interface defining the methods that the http server depend on.
interface IHttpApplication : IRequestHandler {
  /**
    * Load all the application configuration and bootstrap logic.
    *
    * Override this method to add additional bootstrap logic for your application.
    */
  void bootstrap();

  /**
    * Define the HTTP middleware layers for an application.
    *
    * aMmiddlewareQueue The middleware queue to set in your App Class
    * returns MiddlewareQueue
    */
  /* MiddlewareQueue middleware(MiddlewareQueue aMmiddlewareQueue); */
}