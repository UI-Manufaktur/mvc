/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views;

@safe:
import uim.mvc;

/**
 * Abstract base class for all other Helpers in UIM.
 * Provides common methods and features.
 *
 * ### Callback methods
 *
 * Helpers support a number of callback methods. These callbacks allow you to hook into
 * the various view lifecycle events and either modify existing view content or perform
 * other application specific logic. The events are not implemented by this base class, as
 * implementing a callback method subscribes a helper to the related event. The callback methods
 * are as follows:
 *
 * - `beforeRender(IEvent myEvent, $viewFile)` - beforeRender is called before the view file is rendered.
 * - `afterRender(IEvent myEvent, $viewFile)` - afterRender is called after the view file is rendered
 *   but before the layout has been rendered.
 * - beforeLayout(IEvent myEvent, $layoutFile)` - beforeLayout is called before the layout is rendered.
 * - `afterLayout(IEvent myEvent, $layoutFile)` - afterLayout is called after the layout has rendered.
 * - `beforeRenderFile(IEvent myEvent, $viewFile)` - Called before any view fragment is rendered.
 * - `afterRenderFile(IEvent myEvent, $viewFile, myContents)` - Called after any view fragment is rendered.
 *   If a listener returns a non-null value, the output of the rendered file will be set to that.
 */
class DHelper : IEventListener {
    /**
     * Runtime config
     *
     * @var array<string, mixed>
     */
    protected Json _config = null;

    /**
     * Whether the config property has already been configured with defaults
     */
    protected bool _configInitialized = false;

    /**
     * Sets the config.
     *
     * ### Usage
     *
     * Setting a specific value:
     *
     * ```
     * this.setConfig("key", $value);
     * ```
     *
     * Setting a nested value:
     *
     * ```
     * this.setConfig("some.nested.key", $value);
     * ```
     *
     * Updating multiple config settings at the same time:
     *
     * ```
     * this.setConfig(["one": "value", "another": "value"]);
     * ```
     *
     * @param array<string, mixed>|string aKey The key to set, or a complete array of configs.
     * @param mixed|null $value The value to set.
     * @param bool $merge Whether to recursively merge or overwrite existing config, defaults to true.
     * @return this
     * @throws uim.cake.Core\exceptions.UIMException When trying to set a key that is invalid.
     */
    function setConfig($key, $value = null, $merge = true) {
        if (!_configInitialized) {
            _config = _defaultConfig;
            _configInitialized = true;
        }

        _configWrite($key, $value, $merge);

        return this;
    }

    /**
     * Returns the config.
     *
     * ### Usage
     *
     * Reading the whole config:
     *
     * ```
     * this.getConfig();
     * ```
     *
     * Reading a specific value:
     *
     * ```
     * this.getConfig("key");
     * ```
     *
     * Reading a nested value:
     *
     * ```
     * this.getConfig("some.nested.key");
     * ```
     *
     * Reading with default value:
     *
     * ```
     * this.getConfig("some-key", "default-value");
     * ```
     *
     * @param string|null $key The key to get or null for the whole config.
     * @param mixed $default The return value when the key does not exist.
     * @return mixed Configuration data at the named key or null if the key does not exist.
     */
    function getConfig(Nullable!string aKey = null, $default = null) {
        if (!_configInitialized) {
            _config = _defaultConfig;
            _configInitialized = true;
        }

        $return = _configRead($key);

        return $return ?? $default;
    }

    /**
     * Returns the config for this specific key.
     *
     * The config value for this key must exist, it can never be null.
     *
     * @param string aKey The key to get.
     * @return mixed Configuration data at the named key
     * @throws \InvalidArgumentException
     */
    function getConfigOrFail(string aKey) {
        aConfig = this.getConfig($key);
        if (aConfig == null) {
            throw new InvalidArgumentException(sprintf("Expected configuration `%s` not found.", $key));
        }

        return aConfig;
    }

    /**
     * Merge provided config with existing config. Unlike `config()` which does
     * a recursive merge for nested keys, this method does a simple merge.
     *
     * Setting a specific value:
     *
     * ```
     * this.configShallow("key", $value);
     * ```
     *
     * Setting a nested value:
     *
     * ```
     * this.configShallow("some.nested.key", $value);
     * ```
     *
     * Updating multiple config settings at the same time:
     *
     * ```
     * this.configShallow(["one": "value", "another": "value"]);
     * ```
     *
     * @param array<string, mixed>|string aKey The key to set, or a complete array of configs.
     * @param mixed|null $value The value to set.
     * @return this
     */
    function configShallow($key, $value = null) {
        if (!_configInitialized) {
            _config = _defaultConfig;
            _configInitialized = true;
        }

        _configWrite($key, $value, "shallow");

        return this;
    }

    /**
     * Reads a config key.
     *
     * @param string|null $key Key to read.
     * @return mixed
     */
    protected function _configRead(Nullable!string aKey) {
        if ($key == null) {
            return _config;
        }

        if (strpos($key, ".") == false) {
            return _config[$key] ?? null;
        }

        $return = _config;

        foreach (explode(".", $key) as $k) {
            if (!is_array($return) || !isSet($return, $k)) {
                $return = null;
                break;
            }

            $return = $return[$k];
        }

        return $return;
    }

    /**
     * Writes a config key.
     *
     * @param array<string, mixed>|string aKey Key to write to.
     * @param mixed $value Value to write.
     * @param string|bool $merge True to merge recursively, "shallow" for simple merge,
     *   false to overwrite, defaults to false.
     * @return void
     * @throws uim.cake.Core\exceptions.UIMException if attempting to clobber existing config
     */
    protected void _configWrite($key, $value, $merge = false) {
        if (is_string($key) && $value == null) {
            _configDelete($key);

            return;
        }

        if ($merge) {
            $update = is_array($key) ? $key : [$key: $value];
            if ($merge == "shallow") {
                _config = array_merge(_config, Hash::expand($update));
            } else {
                _config = Hash::merge(_config, Hash::expand($update));
            }

            return;
        }

        if (is_array($key)) {
            foreach ($key as $k: $val) {
                _configWrite($k, $val);
            }

            return;
        }

        if (strpos($key, ".") == false) {
            _config[$key] = $value;

            return;
        }

        $update = &_config;
        $stack = explode(".", $key);

        foreach ($stack as $k) {
            if (!is_array($update)) {
                throw new UIMException(sprintf("Cannot set %s value", $key));
            }

            $update[$k] = $update[$k] ?? [];

            $update = &$update[$k];
        }

        $update = $value;
    }

    /**
     * Deletes a single config key.
     *
     * @param string aKey Key to delete.
     * @return void
     * @throws uim.cake.Core\exceptions.UIMException if attempting to clobber existing config
     */
    protected void _configDelete(string aKey) {
        if (strpos($key, ".") == false) {
            unset(_config[$key]);

            return;
        }

        $update = &_config;
        $stack = explode(".", $key);
        $length = count($stack);

        foreach ($stack as $i: $k) {
            if (!is_array($update)) {
                throw new UIMException(sprintf("Cannot unset %s value", $key));
            }

            if (!isSet($update, $k)) {
                break;
            }

            if ($i == $length - 1) {
                unset($update[$k]);
                break;
            }

            $update = &$update[$k];
        }
    }

  // List of helpers used by this helper
  protected string[] _helpers;

  // Default config for this helper.
  protected Json _defaultConfig = Json(null);

  // A helper lookup table used to lazy load helper objects.
  protected array[string] _helperMap = null;

  // The View instance this helper is attached to
  protected DView _view;
  /**
    * Get the view instance this helper is bound to.
    * returns The bound view instance.
    */
  auto DView view() {
    return _view;
  }
  /**
    * Default Constructor
    *
    * attachedView - The View this helper is being attached to.
    * aConfig - Configuration settings for the helper.
    */
  this(DView attachedView, Json configSettings = Json(null)) {
    _view = attachedView;
    this.setConfig(configSettings);

    if (!empty(this.helpers)) {
      _helperMap = $view.helpers().normalizeArray(this.helpers);
    }

    this.initialize(configSettings);
  }

  /**
    * Constructor hook method.
    *
    * Implement this method to avoid having to overwrite the constructor and call parent.
    *
    * configSettings - The configuration settings provided to this helper.
    */
  void initialize(Json configSettings) {
  }
  /**
    * Provide non fatal errors on missing method calls.
    *
    * methodName - Method to invoke
    * @param array myParams Array of params for the method.
    * @return mixed|void
    */
  auto __call(string methodName, array myParams) {
    trigger_error(sprintf("Method %1$s::%2$s does not exist", static::class, $method), E_USER_WARNING);
  }

  /**
    * Lazy loads helpers.
    *
    * propertyName - Name of the property being accessed.
    * @return uim.mvc.views\Helper|null|void Helper instance if helper with provided name exists
    */
  auto __get(string propertyName) {
    if (isSet(_helperMap, myName) && !isSet(this.{myName})) {
      myConfig = ["enabled": false] + (array)_helperMap[myName]["config"];
      this.{myName} = _View.loadHelper(_helperMap[myName]["class"], myConfig);

      return this.{myName};
    }
  }

  /**
    * Returns a string to be used as onclick handler for confirm dialogs.
    *
    * @param string okCode Code to be executed after user chose "OK"
    * @param string cancelCode Code to be executed after user chose "Cancel"
    * @return string "onclick" JS code
    */
  protected string _confirm(string okCode, string cancelCode) {
    return "if (confirm(this.dataset.confirmMessage)) { {$okCode} } {$cancelCode}";
  }

  /**
    * Adds the given class to the element options
    *
    * @param array<string, mixed> myOptions Array options/attributes to add a class to
    * @param string myClass The class name being added.
    * @param string myKey the key to use for class. Defaults to `"class"`.
    * @return array<string, mixed> Array of options with myKey set.
    */
  array addClass(array myOptions, string myClass, string myKey = "class") {
    if (isSet(myOptions, myKey) && is_array(myOptions[myKey])) {
      myOptions[myKey] ~= myClass;
    } elseif (isSet(myOptions[myKey]) && trim(myOptions[myKey])) {
      myOptions[myKey] ~= " " ~ myClass;
    } else {
      myOptions[myKey] = myClass;
    }

    return myOptions;
  }

  /**
    * Get the View callbacks this helper is interested in.
    *
    * By defining one of the callback methods a helper is assumed
    * to be interested in the related event.
    *
    * Override this method if you need to add non-conventional event listeners.
    * Or if you want helpers to listen to non-standard events.
    *
    * @return array<string, mixed>
    */
  Json implementedEvents() {
    myEventMap = [
      "View.beforeRenderFile": "beforeRenderFile",
      "View.afterRenderFile": "afterRenderFile",
      "View.beforeRender": "beforeRender",
      "View.afterRender": "afterRender",
      "View.beforeLayout": "beforeLayout",
      "View.afterLayout": "afterLayout",
    ];
    Json myEvents = Json.emptyObject;
    foreach (myEvent, $method; myEventMap) {
      if (method_exists(this, $method)) {
        myEvents[myEvent] = $method;
      }
    }

    return myEvents;
  }

  // Returns an array that can be used to describe the internal state of this object.
  Json __debugInfo() {
    auto myDebugInfo = Json.emptyObject;
    
    myDebugInfo["helpers"] = this.helpers;
    myDebugInfo["implementedEvents"] = this.implementedEvents();
    myDebugInfo["_config"] = this.getConfig();

    return myDebugInfo;
  }
}
