module uim.baklava.containers.Applicationinterface;

@safe:
import uim.baklava;

// Interface for Applications that configure and use a dependency injection container.
interface IMVCContainerApplication {
    //Register services to the container
    // Registered services can have instances fetched out of the container using `get()`. 
    // Dependencies and parameters will be resolved based on service definitions.
    void services(IMVCContainer container);

    // Create a new container and register services.
    // This will `register()` services provided by both the Application
    // and any plugins if the Application has plugin support.
    IMVCContainer getContainer();
}
