/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views;

@safe:
import uim.mvc;

/**
 * HelperRegistry is used as a registry for loaded helpers and handles loading
 * and constructing helper class objects.
 */
class DMVCHelperRegistry : ObjectRegistry, IEventDispatcher {
  // use EventDispatcherTrait;

  // View object to use when making helpers.
  protected DView _view;

  /**
    * Constructor
    *
    * @param uim.mvc.views\DView $view DView object.
    */
  this(DView aView) {
    _view = aView;
    this.setEventManager(aView.getEventManager());
  }

  /**
    * Tries to lazy load a helper based on its name, if it cannot be found
    * in the application folder, then it tries looking under the current plugin
    * if any
    *
    * helperName - The helper name to be loaded
    * @return bool whether the helper could be loaded or not
    * @throws uim.mvc.views\exceptions.MissingHelperException When a helper could not be found.
    *    App helpers are searched, and then plugin helpers.
    */
  bool __isSet(string helperName) {
    if (isSet(_loaded, helperName)) {
        return true;
    }

    try {
        this.load($helper);
    } catch (MissingHelperException myException) {
        myPlugin = _view.getPlugin();
        if (!empty(myPlugin)) {
            this.load(myPlugin ~ "." ~ $helper);

            return true;
        }
    }

    if (!empty(myException)) {
        throw myException;
    }

    return true;
  }

  /**
    * Provide read access to the loaded objects
    *
    * propertyName - Name of property to read
    * @return uim.mvc.views\Helper|null
    */
  auto __get(string propertyName) {
      if (isSet(_loaded, propertyName)) {
          return _loaded[propertyName];
      }
      if (isSet(this.{propertyName})) {
          return _loaded[propertyName];
      }

      return null;
  }

  /**
    * Resolve a helper classname.
    *
    * Part of the template method for Cake\Core\ObjectRegistry::load()
    *
    * partialClassName - Partial classname to resolve.
    * @return string|null Either the correct class name or null.
    * @psalm-return class-string|null
    */
  protected Nullable!string _resolveClassName(string partialClassName) {
      return App::className(partialClassName, "View/Helper", "Helper");
  }

  /**
    * Throws an exception when a helper is missing.
    *
    * Part of the template method for Cake\Core\ObjectRegistry::load()
    * and Cake\Core\ObjectRegistry::unload()
    *
    * @param string myClass The classname that is missing.
    * @param string|null myPlugin The plugin the helper is missing in.
    * @throws uim.mvc.views\exceptions.MissingHelperException
    */
  protected void _throwMissingClassError(string myClass, Nullable!string myPlugin) {
      throw new MissingHelperException([
          "class": myClass ~ "Helper",
          "plugin": myPlugin,
      ]);
  }

  /**
    * Create the helper instance.
    *
    * Part of the template method for Cake\Core\ObjectRegistry::load()
    * Enabled helpers will be registered with the event manager.
    *
    * className - The class to create.
    * @param string aliasName The alias of the loaded helper.
    * @param array<string, mixed> myConfig An array of settings to use for the helper.
    * @return uim.mvc.views\Helper The constructed helper class.
    * @psalm-suppress MoreSpecificImplementedParamType
    */
  protected Helper _create(string className, string aliasName, array myConfig) {
      DVIWHelper $instance = new myClass(_view, myConfig);

      myEnable = myConfig["enabled"] ?? true;
      if (myEnable) {
          this.getEventManager().on($instance);
      }

      return $instance;
  }
}
