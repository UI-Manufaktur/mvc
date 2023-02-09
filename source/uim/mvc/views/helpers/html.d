/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.helpers;

@safe:
import uim.mvc;

/**
 * Html Helper class for easy use of HTML widgets.
 *
 * HtmlHelper encloses all methods needed while working with HTML pages.
 *
 * @property uim.mvc.views\Helper\UrlHelper myUrl
 * @link https://book.UIM.org/4/en/views/helpers/html.html
 */
class HtmlHelper : DHelper {
  protected DStringTemplate _templater;

  /**
    * Sets templates to use.
    *
    * @param array<string> myTemplates Templates to be added.
    * @return this
    */
  auto setTemplates(array myTemplates) {
      _templater().add(myTemplates);

      return this;
  }

  /**
    * Gets templates to use or a specific template.
    *
    * @param string|null myTemplate String for reading a specific template, null for all.
    * @return array|string
    */
  auto getTemplates(Nullable!string myTemplate = null) {
      return _templater().get(myTemplate);
  }

  /**
    * Formats a template string with myData
    *
    * @param string myName The template name.
    * @param array<string, mixed> myData The data to insert.
    */
  string formatTemplate(string myName, array myData) {
    return _templater().format(myName, myData);
  }

  // Returns the templater instance.
  StringTemplate templater() {
    if (_templater is null) {
      StringTemplate myClass = this.getConfig("templateClass") ?: StringTemplate::class;
      _templater = new myClass();

      myTemplates = this.getConfig("templates");
      if (myTemplates) {
        if (is_string(myTemplates)) {
          _templater.add(_defaultConfig["templates"]);
          _templater.load(myTemplates);
        } else {
          _templater.add(myTemplates);
        }
      }
    }

    return _templater;
  }

  // List of helpers used by this helper
  protected array helpers = ["Url"];

  // Default config for this class
  protected Json _defaultConfig = [
    "templates": [
      "meta": "<meta{{attrs}}/>",
      "metalink": "<link href="{{url}}"{{attrs}}/>",
      "link": "<a href="{{url}}"{{attrs}}>{{content}}</a>",
      "mailto": "<a href="mailto:{{url}}"{{attrs}}>{{content}}</a>",
      "image": "<img src="{{url}}"{{attrs}}/>",
      "tableheader": "<th{{attrs}}>{{content}}</th>",
      "tableheaderrow": "<tr{{attrs}}>{{content}}</tr>",
      "tablecell": "<td{{attrs}}>{{content}}</td>",
      "tablerow": "<tr{{attrs}}>{{content}}</tr>",
      "block": "<div{{attrs}}>{{content}}</div>",
      "blockstart": "<div{{attrs}}>",
      "blockend": "</div>",
      "tag": "<{{tag}}{{attrs}}>{{content}}</{{tag}}>",
      "tagstart": "<{{tag}}{{attrs}}>",
      "tagend": "</{{tag}}>",
      "tagselfclosing": "<{{tag}}{{attrs}}/>",
      "para": "<p{{attrs}}>{{content}}</p>",
      "parastart": "<p{{attrs}}>",
      "css": "<link rel="{{rel}}" href="{{url}}"{{attrs}}/>",
      "style": "<style{{attrs}}>{{content}}</style>",
      "charset": "<meta charset="{{charset}}"/>",
      "ul": "<ul{{attrs}}>{{content}}</ul>",
      "ol": "<ol{{attrs}}>{{content}}</ol>",
      "li": "<li{{attrs}}>{{content}}</li>",
      "javascriptblock": "<script{{attrs}}>{{content}}</script>",
      "javascriptstart": "<script>",
      "javascriptlink": "<script src="{{url}}"{{attrs}}></script>",
      "javascriptend": "</script>",
      "confirmJs": "{{confirm}}",
    ],
  ];

  // Names of script & css files that have been included once
  protected array[string] _includedAssets = null;

  // Options for the currently opened script block buffer if any.
  protected Json _scriptBlockOptions = null;

  /**
    * Creates a link to an external resource and handles basic meta tags
    *
    * Create a meta tag that is output inline:
    *
    * ```
    * this.Html.meta("icon", "favicon.ico");
    * ```
    *
    * Append the meta tag to custom view block "meta":
    *
    * ```
    * this.Html.meta("description", "A great page", ["block": true]);
    * ```
    *
    * Append the meta tag to custom view block:
    *
    * ```
    * this.Html.meta("description", "A great page", ["block": "metaTags"]);
    * ```
    *
    * Create a custom meta tag:
    *
    * ```
    * this.Html.meta(["property": "og:site_name", "content": "UIM"]);
    * ```
    *
    * ### Options
    *
    * - `block` - Set to true to append output to view block "meta" or provide
    *   custom block name.
    *
    * @param array<string, mixed>|string myType The title of the external resource, Or an array of attributes for a
    *   custom meta tag.
    * @param array|string|null myContents The address of the external resource or string for content attribute
    * additionalOptions - Other attributes for the generated tag. If the type attribute is html,
    *    rss, atom, or icon, the mime-type is returned.
    * @return string|null A completed `<link />` element, or null if the element was sent to a block.
    */
  Nullable!string meta(myType, myContents = null, Json additionalOptions = null) {
    if (!is_array(myType)) {
      myTypes = [
          "rss": ["type": "application/rss+xml", "rel": "alternate", "title": myType, "link": myContents],
          "atom": ["type": "application/atom+xml", "title": myType, "link": myContents],
          "icon": ["type": "image/x-icon", "rel": "icon", "link": myContents],
          "keywords": ["name": "keywords", "content": myContents],
          "description": ["name": "description", "content": myContents],
          "robots": ["name": "robots", "content": myContents],
          "viewport": ["name": "viewport", "content": myContents],
          "canonical": ["rel": "canonical", "link": myContents],
          "next": ["rel": "next", "link": myContents],
          "prev": ["rel": "prev", "link": myContents],
          "first": ["rel": "first", "link": myContents],
          "last": ["rel": "last", "link": myContents],
      ];

      if (myType == "icon" && myContents is null) {
          myTypes["icon"]["link"] = "favicon.ico";
      }

      if (isSet(myTypes, myType)) {
          myType = myTypes[myType];
      } elseif (!isSet(myOptions, "type") && myContents  !is null) {
          if (is_array(myContents) && isSet(myContents, "_ext")) {
              myType = myTypes[myContents["_ext"]];
          } else {
              myType = ["name": myType, "content": myContents];
          }
      } elseif (isSet(myOptions, "type") && myTypes[myOptions["type"]])) {
          myType = myTypes[myOptions["type"]];
          unset(myOptions["type"]);
      } else {
          myType = null;
      }
    }

    myOptions += myType + ["block": null];
    $out = "";

    if (isSet(myOptions, "link")) {
      if (is_array(myOptions["link"])) {
          myOptions["link"] = this.Url.build(myOptions["link"]);
      } else {
          myOptions["link"] = this.Url.assetUrl(myOptions["link"]);
      }
      if (isSet(myOptions, "rel") && myOptions["rel"] == "icon") {
          $out = this.formatTemplate("metalink", [
              "url": myOptions["link"],
              "attrs": _templater().formatAttributes(myOptions, ["block", "link"]),
          ]);
          myOptions["rel"] = "shortcut icon";
      }
      $out ~= this.formatTemplate("metalink", [
          "url": myOptions["link"],
          "attrs": _templater().formatAttributes(myOptions, ["block", "link"]),
      ]);
    } else {
      $out = this.formatTemplate("meta", [
        "attrs": _templater().formatAttributes(myOptions, ["block", "type"]),
      ]);
    }

    if (empty(myOptions["block"])) {
      return $out;
    }
    if (myOptions["block"] == true) {
      myOptions["block"] = __FUNCTION__;
    }
    _View.append(myOptions["block"], $out);

    return null;
  }

  /**
    * Returns a charset META-tag.
    *
    * @param string|null $charset The character set to be used in the meta tag. If empty,
    *  The App.encoding value will be used. Example: "utf-8".
    * @return string A meta tag containing the specified character set.
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-charset-tags
    */
  string charset(string charsetForMetaTag = null) {
    if (charsetForMetaTag.isEmpty) {
      charsetForMetaTag = (string)Configure::read("App.encoding").toLower;
    }

    return this.formatTemplate("charset", [
      "charset": !charset.isEmpty ? charset : "utf-8",
    ]);
  }

  /**
    * Creates an HTML link.
    *
    * If myUrl starts with "http://" this is treated as an external link. Else,
    * it is treated as a path to controller/action and parsed with the
    * UrlHelper::build() method.
    *
    * If the myUrl is empty, $title is used instead.
    *
    * ### Options
    *
    * - `escape` Set to false to disable escaping of title and attributes.
    * - `escapeTitle` Set to false to disable escaping of title. Takes precedence
    *   over value of `escape`)
    * - `confirm` JavaScript confirmation message.
    *
    * @param array|string title The content to be wrapped by `<a>` tags.
    *   Can be an array if myUrl is null. If myUrl is null, $title will be used as both the URL and title.
    * @param array|string|null myUrl Cake-relative URL or array of URL parameters, or
    *   external URL (starts with http://)
    * @param array<string, mixed> myOptions Array of options and HTML attributes.
    * @return string An `<a />` element.
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-links
    */
  string link(string title, myUrl = null, DValueMap someOptions = null) {
    $escapeTitle = true;
    if (myUrl  !is null) {
      myUrl = this.Url.build(myUrl, myOptions);
      unset(myOptions["fullBase"]);
    } else {
      myUrl = this.Url.build(title);
      title = htmlspecialchars_decode(myUrl, ENT_QUOTES);
      title = h(urldecode(title));
      $escapeTitle = false;
    }

    if (isSet(myOptions, "escapeTitle")) {
      $escapeTitle = myOptions["escapeTitle"];
      unset(myOptions["escapeTitle"]);
    } elseif (isSet(myOptions, "escape")) {
      $escapeTitle = myOptions["escape"];
    }

    if ($escapeTitle == true) {
        title = h(title);
    } elseif (is_string($escapeTitle)) {
      /** @psalm-suppress PossiblyInvalidArgument */
      title = htmlentities(title, ENT_QUOTES, $escapeTitle);
    }

    myTemplater = _templater();
    $confirmMessage = null;
    if (isSet(myOptions, "confirm")) {
      $confirmMessage = myOptions["confirm"];
      unset(myOptions["confirm"]);
    }
    if ($confirmMessage) {
      $confirm = _confirm("return true;", "return false;");
      myOptions["data-confirm-message"] = $confirmMessage;
      myOptions["onclick"] = myTemplater.format("confirmJs", [
        "confirmMessage": h($confirmMessage),
        "confirm": $confirm,
      ]);
    }

    return myTemplater.format("link", [
      "url": myUrl,
      "attrs": myTemplater.formatAttributes(myOptions),
      "content": $title,
    ]);
  }

  /**
    * Creates an HTML link from route path string.
    *
    * ### Options
    *
    * - `escape` Set to false to disable escaping of title and attributes.
    * - `escapeTitle` Set to false to disable escaping of title. Takes precedence
    *   over value of `escape`)
    * - `confirm` JavaScript confirmation message.
    *
    * @param string title The content to be wrapped by `<a>` tags.
    * @param string myPath Cake-relative route path.
    * @param array myParams An array specifying any additional parameters.
    *   Can be also any special parameters supported by `Router::url()`.
    * @param array<string, mixed> myOptions Array of options and HTML attributes.
    * @return string An `<a />` element.
    * @see uim.mvc.routings.routesr::pathUrl()
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-links
    */
  string linkFromPath(string title, string myPath, array myParams = null, DValueMap someOptions = null) {
      return this.link($title, ["_path": myPath] + myParams, myOptions);
  }

  /**
    * Creates a link element for CSS stylesheets.
    *
    * ### Usage
    *
    * Include one CSS file:
    *
    * ```
    * writeln(this.Html.css("styles.css");
    * ```
    *
    * Include multiple CSS files:
    *
    * ```
    * writeln(this.Html.css(["one.css", "two.css"]);
    * ```
    *
    * Add the stylesheet to view block "css":
    *
    * ```
    * this.Html.css("styles.css", ["block": true]);
    * ```
    *
    * Add the stylesheet to a custom block:
    *
    * ```
    * this.Html.css("styles.css", ["block": "layoutCss"]);
    * ```
    *
    * ### Options
    *
    * - `block` Set to true to append output to view block "css" or provide
    *   custom block name.
    * - `once` Whether the css file should be checked for uniqueness. If true css
    *   files  will only be included once, use false to allow the same
    *   css to be included more than once per request.
    * - `plugin` False value will prevent parsing path as a plugin
    * - `rel` Defaults to "stylesheet". If equal to "import" the stylesheet will be imported.
    * - `fullBase` If true the URL will get a full address for the css file.
    *
    * All other options will be treated as HTML attributes. If the request contains a
    * `cspStyleNonce` attribute, that value will be applied as the `nonce` attribute on the
    * generated HTML.
    *
    * @param array<string>|string myPath The name of a CSS style sheet or an array containing names of
    *   CSS stylesheets. If `myPath` is prefixed with "/", the path will be relative to the webroot
    *   of your application. Otherwise, the path will be relative to your CSS path, usually webroot/css.
    * @param array<string, mixed> myOptions Array of options and HTML arguments.
    * @return string|null CSS `<link />` or `<style />` tag, depending on the type of link.
    * @link https://book.UIM.org/4/en/views/helpers/html.html#linking-to-css-files
    */
  Nullable!string css(myPath, DValueMap someOptions = null) {
      myOptions += [
          "once": true,
          "block": null,
          "rel": "stylesheet",
          "nonce": _View.getRequest().getAttribute("cspStyleNonce"),
      ];

      if (is_array(myPath)) {
          $out = "";
          foreach (myPath as $i) {
              $out ~= "\n\t" ~ (string)this.css($i, myOptions);
          }
          if (empty(myOptions["block"])) {
              return $out ~ "\n";
          }

          return null;
      }

      myUrl = this.Url.css(myPath, myOptions);
      myOptions = array_diff_key(myOptions, ["fullBase": null, "pathPrefix": null]);

      if (myOptions["once"] && isSet(_includedAssets[__METHOD__], myPath)) {
          return null;
      }
      unset(myOptions["once"]);
      _includedAssets[__METHOD__][myPath] = true;

      myTemplater = _templater();
      if (myOptions["rel"] == "import") {
          $out = myTemplater.format("style", [
              "attrs": myTemplater.formatAttributes(myOptions, ["rel", "block"]),
              "content": "@import url(" ~ myUrl ~ ");",
          ]);
      } else {
          $out = myTemplater.format("css", [
              "rel": myOptions["rel"],
              "url": myUrl,
              "attrs": myTemplater.formatAttributes(myOptions, ["rel", "block"]),
          ]);
      }

      if (empty(myOptions["block"])) {
          return $out;
      }
      if (myOptions["block"] == true) {
          myOptions["block"] = __FUNCTION__;
      }
      _View.append(myOptions["block"], $out);

      return null;
  }

  /**
    * Returns one or many `<script>` tags depending on the number of scripts given.
    *
    * If the filename is prefixed with "/", the path will be relative to the base path of your
    * application. Otherwise, the path will be relative to your JavaScript path, usually webroot/js.
    *
    * ### Usage
    *
    * Include one script file:
    *
    * ```
    * writeln(this.Html.script("styles.js");
    * ```
    *
    * Include multiple script files:
    *
    * ```
    * writeln(this.Html.script(["one.js", "two.js"]);
    * ```
    *
    * Add the script file to a custom block:
    *
    * ```
    * this.Html.script("styles.js", ["block": "bodyScript"]);
    * ```
    *
    * ### Options
    *
    * - `block` Set to true to append output to view block "script" or provide
    *   custom block name.
    * - `once` Whether the script should be checked for uniqueness. If true scripts will only be
    *   included once, use false to allow the same script to be included more than once per request.
    * - `plugin` False value will prevent parsing path as a plugin
    * - `fullBase` If true the url will get a full address for the script file.
    *
    * All other options will be added as attributes to the generated script tag.
    * If the current request has a `cspScriptNonce` attribute, that value will
    * be inserted as a `nonce` attribute on the script tag.
    *
    * @param array<string>|string myUrl String or array of javascript files to include
    * @param array<string, mixed> myOptions Array of options, and html attributes see above.
    * @return string|null String of `<script />` tags or null if block is specified in options
    *   or if $once is true and the file has been included before.
    * @link https://book.UIM.org/4/en/views/helpers/html.html#linking-to-javascript-files
    */
  Nullable!string script(myUrl, DValueMap someOptions = null) {
      _defaults = [
          "block": null,
          "once": true,
          "nonce": _View.getRequest().getAttribute("cspScriptNonce"),
      ];
      myOptions += $defaults;

      if (is_array(myUrl)) {
          $out = "";
          foreach (myUrl as $i) {
              $out ~= "\n\t" ~ (string)this.script($i, myOptions);
          }
          if (empty(myOptions["block"])) {
              return $out ~ "\n";
          }

          return null;
      }

      myUrl = this.Url.script(myUrl, myOptions);
      myOptions = array_diff_key(myOptions, ["fullBase": null, "pathPrefix": null]);

      if (myOptions["once"] && isSet(_includedAssets[__METHOD__], myUrl)) {
          return null;
      }
      _includedAssets[__METHOD__][myUrl] = true;

      $out = this.formatTemplate("javascriptlink", [
          "url": myUrl,
          "attrs": _templater().formatAttributes(myOptions, ["block", "once"]),
      ]);

      if (empty(myOptions["block"])) {
          return $out;
      }
      if (myOptions["block"] == true) {
          myOptions["block"] = __FUNCTION__;
      }
      _View.append(myOptions["block"], $out);

      return null;
  }

  /**
    * Wrap $script in a script tag.
    *
    * ### Options
    *
    * - `block` Set to true to append output to view block "script" or provide
    *   custom block name.
    *
    * @param string script The script to wrap
    * @param array<string, mixed> myOptions The options to use. Options not listed above will be
    *    treated as HTML attributes.
    * @return string|null String or null depending on the value of `myOptions["block"]`
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-inline-javascript-blocks
    */
  Nullable!string scriptBlock(string script, DValueMap someOptions = null) {
      myOptions += ["block": null, "nonce": _View.getRequest().getAttribute("cspScriptNonce")];

      $out = this.formatTemplate("javascriptblock", [
          "attrs": _templater().formatAttributes(myOptions, ["block"]),
          "content": $script,
      ]);

      if (empty(myOptions["block"])) {
          return $out;
      }
      if (myOptions["block"] == true) {
          myOptions["block"] = "script";
      }
      _View.append(myOptions["block"], $out);

      return null;
  }

  /**
    * Begin a script block that captures output until HtmlHelper::scriptEnd()
    * is called. This capturing block will capture all output between the methods
    * and create a scriptBlock from it.
    *
    * ### Options
    *
    * - `block` Set to true to append output to view block "script" or provide
    *   custom block name.
    *
    * @param array<string, mixed> myOptions Options for the code block.
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-inline-javascript-blocks
    */
  void scriptStart(DValueMap someOptions = null) {
      _scriptBlockOptions = myOptions;
      ob_start();
  }

  /**
    * End a Buffered section of JavaScript capturing.
    * Generates a script tag inline or appends to specified view block depending on
    * the settings used when the scriptBlock was started
    *
    * @return string|null Depending on the settings of scriptStart() either a script tag or null
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-inline-javascript-blocks
    */
  Nullable!string scriptEnd() {
      $buffer = ob_get_clean();
      myOptions = _scriptBlockOptions;
      _scriptBlockOptions = null;

      return this.scriptBlock($buffer, myOptions);
  }

  /**
    * Builds CSS style data from an array of CSS properties
    *
    * ### Usage:
    *
    * ```
    * writeln(this.Html.style(["margin": "10px", "padding": "10px"], true);
    *
    * // creates
    * "margin:10px;padding:10px;"
    * ```
    *
    * @param array<string, string> myData Style data array, keys will be used as property names, values as property values.
    * @param bool $oneLine Whether the style block should be displayed on one line.
    * @return string CSS styling data
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-css-programatically
    */
  string style(array myData, bool $oneLine = true) {
      $out = null;
      foreach (myData as myKey: myValue) {
          $out ~= myKey ~ ":" ~ myValue ~ ";";
      }
      if ($oneLine) {
          return implode(" ", $out);
      }

      return implode("\n", $out);
  }

  /**
    * Creates a formatted IMG element.
    *
    * This method will set an empty alt attribute if one is not supplied.
    *
    * ### Usage:
    *
    * Create a regular image:
    *
    * ```
    * writeln(this.Html.image("cake_icon.png", ["alt": "UIM"]);
    * ```
    *
    * Create an image link:
    *
    * ```
    * writeln(this.Html.image("cake_icon.png", ["alt": "UIM", "url": "https://UIM.org"]);
    * ```
    *
    * ### Options:
    *
    * - `url` If provided an image link will be generated and the link will point at
    *   `myOptions["url"]`.
    * - `fullBase` If true the src attribute will get a full address for the image file.
    * - `plugin` False value will prevent parsing path as a plugin
    *
    * @param array|string myPath Path to the image file, relative to the webroot/img/ directory.
    * @param array<string, mixed> myOptions Array of HTML attributes. See above for special options.
    * @return string completed img tag
    * @link https://book.UIM.org/4/en/views/helpers/html.html#linking-to-images
    */
  string image(myPath, DValueMap someOptions = null) {
      if (is_string(myPath)) {
          myPath = this.Url.image(myPath, myOptions);
      } else {
          myPath = this.Url.build(myPath, myOptions);
      }
      myOptions = array_diff_key(myOptions, ["fullBase": null, "pathPrefix": null]);

      if (!isSet(myOptions, "alt")) {
          myOptions["alt"] = "";
      }

      myUrl = false;
      if (!empty(myOptions["url"])) {
          myUrl = myOptions["url"];
          unset(myOptions["url"]);
      }

      myTemplater = _templater();
      $image = myTemplater.format("image", [
          "url": myPath,
          "attrs": myTemplater.formatAttributes(myOptions),
      ]);

      if (myUrl) {
          return myTemplater.format("link", [
              "url": this.Url.build(myUrl),
              "attrs": null,
              "content": $image,
          ]);
      }

      return $image;
  }

  /**
    * Returns a row of formatted and named TABLE headers.
    *
    * @param array myNames Array of tablenames. Each tablename can be string, or array with name and an array with a set
    *     of attributes to its specific tag
    * @param array<string, mixed>|null $trOptions HTML options for TR elements.
    * @param array<string, mixed>|null $thOptions HTML options for TH elements.
    * @return string Completed table headers
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-table-headings
    */
  string tableHeaders(array myNames, ?array $trOptions = null, ?array $thOptions = null) {
      $out = null;
      foreach (myNames as $arg) {
          if (!is_array($arg)) {
              myContents = $arg;
              $attrs = $thOptions;
          } elseif (isSet($arg, 0, 1)) {
              myContents = $arg[0];
              $attrs = $arg[1];
          } else {
              myContents = key($arg);
              $attrs = current($arg);
          }

          $out ~= this.formatTemplate("tableheader", [
              "attrs": _templater().formatAttributes($attrs),
              "content": myContents,
          ]);
      }

      return this.tableRow(implode(" ", $out), (array)$trOptions);
  }

  /**
    * Returns a formatted string of table rows (TR"s with TD"s in them).
    *
    * @param array|string myData Array of table data
    * @param array<string, mixed>|bool|null $oddTrOptions HTML options for odd TR elements if true useCount is used
    * @param array<string, mixed>|bool|null $evenTrOptions HTML options for even TR elements
    * @param bool $useCount adds class "column-$i"
    * @param bool $continueOddEven If false, will use a non-static myCount variable,
    *    so that the odd/even count is reset to zero just for that call.
    * @return string Formatted HTML
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-table-cells
    */
  string tableCells(
      myData,
      $oddTrOptions = null,
      $evenTrOptions = null,
      bool $useCount = false,
      bool $continueOddEven = true
  ) {
      if (!is_array(myData)) {
          myData = [[myData]];
      } elseif (empty(myData[0]) || !is_array(myData[0])) {
          myData = [myData];
      }

      if ($oddTrOptions == true) {
          $useCount = true;
          $oddTrOptions = null;
      }

      if ($evenTrOptions == false) {
          $continueOddEven = false;
          $evenTrOptions = null;
      }

      if ($continueOddEven) {
          static myCount = 0;
      } else {
          myCount = 0;
      }

      $out = null;
      foreach (myData as $line) {
          myCount++;
          $cellsOut = _renderCells($line, $useCount);
          $opts = myCount % 2 ? $oddTrOptions : $evenTrOptions;
          Json myOptions = (array)$opts;
          $out ~= this.tableRow(implode(" ", $cellsOut), myOptions);
      }

      return implode("\n", $out);
  }

  /**
    * Renders cells for a row of a table.
    *
    * This is a helper method for tableCells(). Overload this method as you
    * need to change the behavior of the cell rendering.
    *
    * @param array $line Line data to render.
    * @param bool $useCount Renders the count into the row. Default is false.
    */
  protected string[] _renderCells(array $line, bool $useCount = false) {
      $i = 0;
      $cellsOut = null;
      foreach ($line as $cell) {
          $cellOptions = null;

          if (is_array($cell)) {
              $cellOptions = $cell[1];
              $cell = $cell[0];
          }

          if ($useCount) {
              $i += 1;
              if (isSet($cellOptions, "class")) {
                  $cellOptions["class"] ~= " column-" ~ $i;
              } else {
                  $cellOptions["class"] = "column-" ~ $i;
              }
          }

          $cellsOut ~= this.tableCell((string)$cell, $cellOptions);
      }

      return $cellsOut;
  }

  /**
    * Renders a single table row (A TR with attributes).
    *
    * @param string myContents The content of the row.
    * @param array<string, mixed> myOptions HTML attributes.
    */
  string tableRow(string myContents, DValueMap someOptions = null) {
      return this.formatTemplate("tablerow", [
          "attrs": _templater().formatAttributes(myOptions),
          "content": myContents,
      ]);
  }

  /**
    * Renders a single table cell (A TD with attributes).
    *
    * @param string myContents The content of the cell.
    * @param array<string, mixed> myOptions HTML attributes.
    */
  string tableCell(string myContents, DValueMap someOptions = null) {
      return this.formatTemplate("tablecell", [
          "attrs": _templater().formatAttributes(myOptions),
          "content": myContents,
      ]);
  }

  /**
    * Returns a formatted block tag, i.e DIV, SPAN, P.
    *
    * ### Options
    *
    * - `escape` Whether the contents should be html_entity escaped.
    *
    * @param string myName Tag name.
    * @param string|null $text String content that will appear inside the div element.
    *   If null, only a start tag will be printed
    * @param array<string, mixed> myOptions Additional HTML attributes of the DIV tag, see above.
    * @return string The formatted tag element
    */
  string tag(string myName, Nullable!string text = null, DValueMap someOptions = null) {
      if (myOptions.get("escape", null)) {
          $text = h($text);
          unset(myOptions["escape"]);
      }
      if ($text is null) {
          $tag = "tagstart";
      } else {
          $tag = "tag";
      }

      return this.formatTemplate($tag, [
          "attrs": _templater().formatAttributes(myOptions),
          "tag": myName,
          "content": $text,
      ]);
  }

  /**
    * Returns a formatted DIV tag for HTML FORMs.
    *
    * ### Options
    *
    * - `escape` Whether the contents should be html_entity escaped.
    *
    * @param string|null myClass CSS class name of the div element.
    * @param string|null $text String content that will appear inside the div element.
    *   If null, only a start tag will be printed
    * @param array<string, mixed> myOptions Additional HTML attributes of the DIV tag
    * @return string The formatted DIV element
    */
  string div(Nullable!string myClass = null, Nullable!string text = null, DValueMap someOptions = null) {
      if (!empty(myClass)) {
          myOptions["class"] = myClass;
      }

      return this.tag("div", $text, myOptions);
  }

  /**
    * Returns a formatted P tag.
    *
    * ### Options
    *
    * - `escape` Whether the contents should be html_entity escaped.
    *
    * @param string|null myClass CSS class name of the p element.
    * @param string|null $text String content that will appear inside the p element.
    * @param array<string, mixed> myOptions Additional HTML attributes of the P tag
    * @return string The formatted P element
    */
  string para(Nullable!string myClass, Nullable!string text, DValueMap someOptions = null) {
      if (!empty(myOptions["escape"])) {
          $text = h($text);
      }
      if (myClass) {
          myOptions["class"] = myClass;
      }
      $tag = "para";
      if ($text is null) {
          $tag = "parastart";
      }

      return this.formatTemplate($tag, [
          "attrs": _templater().formatAttributes(myOptions),
          "content": $text,
      ]);
  }

  /**
    * Returns an audio/video element
    *
    * ### Usage
    *
    * Using an audio file:
    *
    * ```
    * writeln(this.Html.media("audio.mp3", ["fullBase": true]);
    * ```
    *
    * Outputs:
    *
    * ```
    * <video src="http://www.somehost.com/files/audio.mp3">Fallback text</video>
    * ```
    *
    * Using a video file:
    *
    * ```
    * writeln(this.Html.media("video.mp4", ["text": "Fallback text"]);
    * ```
    *
    * Outputs:
    *
    * ```
    * <video src="/files/video.mp4">Fallback text</video>
    * ```
    *
    * Using multiple video files:
    *
    * ```
    * writeln(this.Html.media(
    *      ["video.mp4", ["src": "video.ogv", "type": "video/ogg; codecs="theora, vorbis""]],
    *      ["tag": "video", "autoplay"]
    * );
    * ```
    *
    * Outputs:
    *
    * ```
    * <video autoplay="autoplay">
    *      <source src="/files/video.mp4" type="video/mp4"/>
    *      <source src="/files/video.ogv" type="video/ogv; codecs="theora, vorbis""/>
    * </video>
    * ```
    *
    * ### Options
    *
    * - `tag` Type of media element to generate, either "audio" or "video".
    *  If tag is not provided it"s guessed based on file"s mime type.
    * - `text` Text to include inside the audio/video tag
    * - `pathPrefix` Path prefix to use for relative URLs, defaults to "files/"
    * - `fullBase` If provided the src attribute will get a full address including domain name
    *
    * @param array|string myPath Path to the video file, relative to the webroot/{myOptions["pathPrefix"]} directory.
    *  Or an array where each item itself can be a path string or an associate array containing keys `src` and `type`
    * @param array<string, mixed> myOptions Array of HTML attributes, and special options above.
    * @return string Generated media element
    */
  string media(myPath, DValueMap someOptions = null) {
      myOptions += [
          "tag": null,
          "pathPrefix": "files/",
          "text": "",
      ];

      if (!empty(myOptions["tag"])) {
          $tag = myOptions["tag"];
      } else {
          $tag = null;
      }

      if (is_array(myPath)) {
          $sourceTags = "";
          foreach (myPath as &$source) {
              if (is_string($source)) {
                  $source = [
                      "src": $source,
                  ];
              }
              if (!isSet($source, "type")) {
                  $ext = pathinfo($source["src"], PATHINFO_EXTENSION);
                  $source["type"] = _View.getResponse().getMimeType($ext);
              }
              $source["src"] = this.Url.assetUrl($source["src"], myOptions);
              $sourceTags ~= this.formatTemplate("tagselfclosing", [
                  "tag": "source",
                  "attrs": _templater().formatAttributes($source),
              ]);
          }
          unset($source);
          myOptions["text"] = $sourceTags . myOptions["text"];
          unset(myOptions["fullBase"]);
      } else {
          if (empty(myPath) && !empty(myOptions["src"])) {
              myPath = myOptions["src"];
          }
          myOptions["src"] = this.Url.assetUrl(myPath, myOptions);
      }

      if ($tag is null) {
          if (is_array(myPath)) {
              $mimeType = myPath[0]["type"];
          } else {
              string $mimeType = _View.getResponse().getMimeType(pathinfo(myPath, PATHINFO_EXTENSION));
          }
          if (preg_match("#^video/#", $mimeType)) {
              $tag = "video";
          } else {
              $tag = "audio";
          }
      }

      if (isSet(myOptions, "poster")) {
          myOptions["poster"] = this.Url.assetUrl(
              myOptions["poster"],
              ["pathPrefix": Configure::read("App.imageBaseUrl")] + myOptions
          );
      }
      $text = myOptions["text"];

      myOptions = array_diff_key(myOptions, [
          "tag": null,
          "fullBase": null,
          "pathPrefix": null,
          "text": null,
      ]);

      return this.tag($tag, $text, myOptions);
  }

  /**
    * Build a nested list (UL/OL) out of an associative array.
    *
    * Options for myOptions:
    *
    * - `tag` - Type of list tag to use (ol/ul)
    *
    * Options for $itemOptions:
    *
    * - `even` - Class to use for even rows.
    * - `odd` - Class to use for odd rows.
    *
    * @param array $list Set of elements to list
    * @param array<string, mixed> myOptions Options and additional HTML attributes of the list (ol/ul) tag.
    * @param array<string, mixed> $itemOptions Options and additional HTML attributes of the list item (LI) tag.
    * @return string The nested list
    * @link https://book.UIM.org/4/en/views/helpers/html.html#creating-nested-lists
    */
  string nestedList(array $list, DValueMap someOptions = null, array $itemOptions = null) {
      myOptions += ["tag": "ul"];
      myItems = _nestedListItem($list, myOptions, $itemOptions);

      return this.formatTemplate(myOptions["tag"], [
          "attrs": _templater().formatAttributes(myOptions, ["tag"]),
          "content": myItems,
      ]);
  }

  /**
    * Internal function to build a nested list (UL/OL) out of an associative array.
    *
    * @param array myItems Set of elements to list.
    * @param array<string, mixed> myOptions Additional HTML attributes of the list (ol/ul) tag.
    * @param array<string, mixed> $itemOptions Options and additional HTML attributes of the list item (LI) tag.
    * @return string The nested list element
    * @see uim.mvc.views\Helper\HtmlHelper::nestedList()
    */
  protected string _nestedListItem(array myItems, DValueMap someOptions, array $itemOptions) {
      $out = "";

      $index = 1;
      foreach (myItems as myKey: $item) {
          if (is_array($item)) {
              $item = myKey . this.nestedList($item, myOptions, $itemOptions);
          }
          if (isSet($itemOptions, "even") && $index % 2 == 0) {
              $itemOptions["class"] = $itemOptions["even"];
          } elseif (isSet($itemOptions, "odd") && $index % 2 != 0) {
              $itemOptions["class"] = $itemOptions["odd"];
          }
          $out ~= this.formatTemplate("li", [
              "attrs": _templater().formatAttributes($itemOptions, ["even", "odd"]),
              "content": $item,
          ]);
          $index++;
      }

      return $out;
  }

  // Event listeners.
  Json implementedEvents() {
      return [];
  }
}
