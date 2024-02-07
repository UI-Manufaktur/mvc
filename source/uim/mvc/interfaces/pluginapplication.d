module uim.mvc.interfaces.pluginapplication;

import uim.mvc;
@safe:

/**
 * Interface for Applications that leverage plugins & events.
 *
 * Events can be bound to the application event manager during
 * the application"s bootstrap and plugin bootstrap.
 */ 
interface IPluginApplication /* : IEventDispatcher */{
    /**
     * Add a plugin to the loaded plugin set.
     *
     * If the named plugin does not exist, or does not define a Plugin class, an
     * instance of `Cake\Core\DPlugin` will be used. This generated class will have
     * all plugin hooks enabled.
     *
     * @param uim.cake.Core\IPlugin|string aName The plugin name or plugin object.
     * @param IData[string][] aConfig The configuration data for the plugin if using a string for $name
     * @return this
     */
    /* IPluginApplication addPlugin(string aName, DConfigurationValue configSettings = null);
 */
    /**
     * Run bootstrap logic for loaded plugins.
     */
    void pluginBootstrap();

    /**
     * Run routes hooks for loaded plugins
     *
     * @param uim.cake.routings.routesBuilder $routes The route builder to use.
     * @return uim.cake.routings.routesBuilder
     */
    /* RouteBuilder pluginRoutes(RouteBuilder someRoutes); */

    /**
     * Run middleware hooks for plugins
     *
     * @param uim.cake.http.MiddlewareQueue $middleware The MiddlewareQueue to use.
     * @return uim.cake.http.MiddlewareQueue
     */
    /* MiddlewareQueue pluginMiddleware(MiddlewareQueue aMiddleware); */

    /**
     * Run console hooks for plugins
     *
     * @param uim.cake.consoles.CommandCollection $commands The CommandCollection to use.
     * @return uim.cake.consoles.CommandCollection
     */
    /* ICommandCollection pluginConsole(ICommandCollection someCommands); */
}
