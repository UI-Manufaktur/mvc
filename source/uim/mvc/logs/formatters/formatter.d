module uim.mvc.logs.formatters.formatter;

import uim.mvc;

@safe:

abstract class DLogFormatter {
  // Runtime config
  protected Json _config = null;

  // Whether the config property has already been configured with defaults
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
    * @param Json[string][]|string aKey The key to set, or a complete array of configs.
    * @param mixed|null $value The value to set.
    * @param bool $merge Whether to recursively merge or overwrite existing config, defaults to true.
    * @return this
    * @throws uim.cake.Core\exceptions.UIMException When trying to set a key that is invalid.
    */
  /*     DLoFormatter config(string aKey, IValue aValue = null, bool shouldMmerge = true) {
      if (!_configInitialized) {
          _config = _defaultConfig;
          _configInitialized = true;
      }

      _configWrite(aKey, aValue, shouldMmerge);

      return this;
    } */

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
    * aKey - The key to get or null for the whole config.
    * defaultValue - The return value when the key does not exist.
    * returns Configuration data at the named key or null if the key does not exist.
    */
  /*     Json config(string aKey = null, Json defaultValue = Json(null)) {
      if (!_configInitialized) {
          _config = _defaultConfig;
          _configInitialized = true;
      }

        auto aValue = _configRead(aKey);
      return (aValue.isNull ? defaultValue : aValue);
  } */

  /**
    * Returns the config for this specific key.
    *
    * The config value for this key must exist, it can never be null.
    *
    * aKey -  The key to get.
    * returns Configuration data at the named key
    */
  /*   Json configOrFail(string aKey) {
      auto myConfig = this.getConfig(aKey);
      if (myConfig.isNull) {
          throw new InvalidArgumentException(sprintf("Expected configuration `%s` not found.", aKey));
      }

      return myConfig;
  } */

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
    * @param Json[string][]|string aKey The key to set, or a complete array of configs.
    * @param mixed|null $value The value to set.
    */
  DLogFormatter configShallow(string aKey, Json aValue = null) {
    /*       if (!_configInitialized) {
          _config = _defaultConfig;
          _configInitialized = true;
      }

      _configWrite($key, $value, "shallow"); */

    return this;
  }

  /**
    * Reads a config key.
    *
    * aKey - Key to read.
    */
  protected Json _configRead(string aKey) {
    if (aKey == null) {
      return _config;
    }

    /*       if (aKey.indexOf(".") != -1) {
        return _config.get(aKey, null);
      } */

    auto result = _config;
    /* 
      foreach (myKeyPart; aKey.split(".")) {
          if (!is_array($return) || !isSet($return, myKeyPart)) {
              $return = null;
              break;
          }

          result = $return[myKeyPart];
      } */

    return result;
  }

  /**
    * Writes a config key.
    *
    * @param Json[string][]|string aKey Key to write to.
    * @param mixed $value Value to write.
    * @param string|bool $merge True to merge recursively, "shallow" for simple merge,
    *   false to overwrite, defaults to false.
    * @return void
    * @throws uim.cake.Core\exceptions.UIMException if attempting to clobber existing config
    */
  /* protected void _configWrite($key, $value, $merge = false) {
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
      $stack = $key.split(".");

      foreach ($stack as $k) {
          if (!is_array($update)) {
              throw new UIMException(sprintf("Cannot set %s value", $key));
          }

          $update[$k] = $update[$k] ?? [];

          $update = &$update[$k];
      }

      $update = $value;
  } */

  /**
    * Deletes a single config key.
    *
    * @param string aKey Key to delete.
    * @return void
    * @throws uim.cake.Core\exceptions.UIMException if attempting to clobber existing config
    * /
  protected void _configDelete(string aKey) {
      /* if (strpos($key, ".") == false) {
          unset(_config[$key]);

          return;
      }

      $update = &_config;
      $stack = $key.split(".");
      $length = count($stack);

      foreach ($i: $k; $stack) {
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

  /**
    * Default config for this class
    *
    * /
  protected DConfigurationValue _defaultConfig;

  /**
    * @param Json[string][] myConfig Config options
    * /
  this(Json aConfig = null) {
      this.setConfig(myConfig);
  }

  void initialize(DConfigurationValue configSettings = null) {
      _defaultConfig = Json.emptyObject;
  }
  /**
    * Formats message.
    *
    * @param mixed $level Logging level
    * @param string myMessage Message string
    * @param array $context Mesage context
    * @return string Formatted message
    * /
  abstract string format($level, string myMessage, array $context = null); */
}
