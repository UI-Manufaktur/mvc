module uim.mvc.interfaces.plugin;

/**
 * Plugin Interface
 * @method void services(uim.cake.Core\IContainer $container) Register plugin services to the application"s container
 */
interface IPlugin {
  // List of valid hooks.
  const string[] VALID_HOOKS = ["bootstrap", "console", "middleware", "routes", "services"];

  // Get the name of this plugin.
  string geame();

  // Get the filesystem path to this plugin
  string getPath();

  // Get the filesystem path to configuration for this plugin
  string getConfigPath();

  // Get the filesystem path to configuration for this plugin
  string getClassPath();

  // Get the filesystem path to templates for this plugin
  string getTemplatePath();

  /**
    * Load all the application configuration and bootstrap logic.
    *
    * The default implementation of this method will include the `config/bootstrap.php` in the plugin if it exist. You
    * can override this method to replace that behavior.
    *
    * The host application is provided as an argument. This allows you to load additional
    * plugin dependencies, or attach events.
    *
    * @param uim.cake.Core\IPluginApplication $app The host application
    */
  void bootstrap(IPluginApplication anApp);

  /**
    * Add console commands for the plugin.
    *
    * @param uim.cake.consoles.CommandCollection $commands The command collection to update
    * @return uim.cake.consoles.CommandCollection
    */
  DCommandCollection console(ICommandCollection aCommandCollection);

  /**
    * Add middleware for the plugin.
    *
    * @param uim.cake.http.MiddlewareQueue $middlewareQueue The middleware queue to update.
    * @return uim.cake.http.MiddlewareQueue
    */
  MiddlewareQueue middleware(MiddlewareQueue anMiddlewareQueue);

  /**
    * Add routes for the plugin.
    *
    * The default implementation of this method will include the `config/routes.php` in the plugin if it exists. You
    * can override this method to replace that behavior.
    *
    * @param uim.cake.routings.routesBuilder $routes The route builder to update.
    */
  void routes(RouteBuilder anRoutes);

  /**
    * Disables the named hook
    *
    * @param string aHook The hook to disable
    */
  IPlugin disable(string aHook);

  /**
    * Enables the named hook
    *
    * @param string aHook The hook to disable
    */
  IPlugin enable(string aHook);

  /**
    * Check if the named hook is enabled
    *
    * @param string aHook The hook to check
    */
  bool isEnabled(string aHook);
}
