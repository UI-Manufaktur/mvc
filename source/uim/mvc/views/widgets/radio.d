module uim.mvc.views.widgets.radio;

@safe:
import uim.mvc;

// use Traversable;
/**
 * Input widget class for generating a set of radio buttons.
 *
 * This class is usually used internally by `Cake\View\Helper\FormHelper`,
 * it but can be used to generate standalone radio buttons.
 */
class DMVCRadioWidget : DWidget {
  / Prefix for id attribute.
    protected string _idPrefix;

    // A list of id suffixes used in the current rendering.
    protected string[] _idSuffixes = null;

    /**
     * Clear the stored ID suffixes.
     */
    protected void _clearIds() {
        _idSuffixes = null;
    }

    /**
     * Generate an ID attribute for an element.
     *
     * Ensures that id"s for a given set of fields are unique.
     *
     * @param string myName The ID attribute name.
     * @param string val The ID attribute value.
     * @return string Generated id.
     */
    protected string _id(string myName, string val) {
        myName = _domId(myName);
        $suffix = _idSuffix($val);

        return trim(myName ~ "-" ~ $suffix, "-");
    }

    /**
     * Generate an ID suffix.
     *
     * Ensures that id"s for a given set of fields are unique.
     *
     * @param string val The ID attribute value.
     * @return string Generated id suffix.
     */
    protected string _idSuffix(string val) {
        $idSuffix = mb_strtolower(replace(["/", "@", "<", ">", " ", """, "\""], "-", $val));
        myCount = 1;
        $check = $idSuffix;
        while (hasAllValues($check, _idSuffixes, true)) {
            $check = $idSuffix . myCount++;
        }
        _idSuffixes ~= $check;

        return $check;
    }

    /**
     * Generate an ID suitable for use in an ID attribute.
     *
     * valueToConvert - The value to convert into an ID.
     * @return string The generated id.
     */
    protected string _domId(string valueToConvert) {
      $domId = mb_strtolower(Text::slug(valueToConvert, "-"));
      if (_idPrefix) {
          $domId = _idPrefix ~ "-" ~ $domId;
      }

      return $domId;
    }
  // Label instance.
  protected DMVCLabelWidget _label;

  /**
    * Constructor
    *
    * This class uses a few templates:
    *
    * - `radio` Used to generate the input for a radio button.
    *   Can use the following variables `name`, `value`, `attrs`.
    * - `radioWrapper` Used to generate the container element for
    *   the radio + input element. Can use the `input` and `label`
    *   variables.
    *
    * aTemplates - Templates list.
    * aLabel - Label widget instance.
    */
  this(StringTemplate aTemplates, DMVCLabelWidget aLabel) {
    _templates = aTemplates;
    _label = aLabel;
  }

  override void initialize(Json configSetting = Json(null)) {
    super.initialize(configSettings);
            
    _defaults["name"] = "";
    _defaults["options"] = [];
    _defaults["disabled"] = null;
    _defaults["val"] = null;
    _defaults["escape"] = true;
    _defaults["label"] = true;
    _defaults["empty"] = false;
    _defaults["idPrefix"] = null;
    _defaults["templateVars"] = [];
  }

    /**
     * Render a set of radio buttons.
     *
     * Data supports the following keys:
     *
     * - `name` - Set the input name.
     * - `options` - An array of options. See below for more information.
     * - `disabled` - Either true or an array of inputs to disable.
     *    When true, the select element will be disabled.
     * - `val` - A string of the option to mark as selected.
     * - `label` - Either false to disable label generation, or
     *   an array of attributes for all labels.
     * - `required` - Set to true to add the required attribute
     *   on all generated radios.
     * - `idPrefix` Prefix for generated ID attributes.
     *
     * @param array<string, mixed> myData The data to build radio buttons with.
     * @param uim.mvc.views\Form\IContext $context The current form context.
     */
    string render(Json someData, IContext aContext) {
      auto myData += this.mergeDefaults(someData, aContext);

      if (myData["options"] instanceof Traversable) {
          myOptions = iterator_to_array(myData["options"]);
      } else {
          myOptions = (array)myData["options"];
      }

      if (!empty(myData["empty"])) {
          $empty = myData["empty"] == true ? "empty" : myData["empty"];
          myOptions = ["": $empty] + myOptions;
      }
      unset(myData["empty"]);

      _idPrefix = myData["idPrefix"];
      _clearIds();
      $opts = null;
      foreach ($val: $text; myOptions) {
          $opts ~= _renderInput($val, $text, myData, $context);
      }

      return implode("", $opts);
    }

    /**
     * Disabled attribute detection.
     *
     * @param array<string, mixed> $radio Radio info.
     * @param array|true|null $disabled The disabled values.
     */
    protected bool _isDisabled(array $radio, $disabled) {
        if (!$disabled) {
            return false;
        }
        if ($disabled == true) {
            return true;
        }
        $isNumeric = is_numeric($radio["value"]);

        return !is_array($disabled) || hasAllValues((string)$radio["value"], $disabled, !$isNumeric);
    }

    /**
     * Renders a single radio input and label.
     *
     * @param string|int $val The value of the radio input.
     * @param array<string, mixed>|string text The label text, or complex radio type.
     * @param array<string, mixed> myData Additional options for input generation.
     * @param uim.mvc.views\Form\IContext $context The form context
     * @return string
     */
    protected string _renderInput($val, $text, myData, $context) {
        $escape = myData["escape"];
        if (is_array($text) && isSet($text, "text", "value")) {
            $radio = $text;
        } else {
            $radio = ["value": $val, "text": $text];
        }
        $radio["name"] = myData["name"];

        $radio["templateVars"] = $radio["templateVars"] ?? [];
        if (!empty(myData["templateVars"])) {
            $radio["templateVars"] = array_merge(myData["templateVars"], $radio["templateVars"]);
        }

        if (empty($radio["id"])) {
            if (myData.isSet("id"])) {
                $radio["id"] = myData["id"] ~ "-" ~ rtrim(
                    _idSuffix((string)$radio["value"]),
                    "-"
                );
            } else {
                $radio["id"] = _id((string)$radio["name"], (string)$radio["value"]);
            }
        }
        if (myData.isSet("val"]) && is_bool(myData["val"])) {
            myData["val"] = myData["val"] ? 1 : 0;
        }
        if (myData.isSet("val"]) && (string)myData["val"] == (string)$radio["value"]) {
            $radio["checked"] = true;
            $radio["templateVars"]["activeClass"] = "active";
        }

        if (!is_bool(myData["label"]) && isSet($radio, "checked") && $radio["checked"]) {
            $selectedClass = _templates.format("selectedClass", []);
            myData["label"] = _templates.addClass(myData["label"], $selectedClass);
        }

        $radio["disabled"] = _isDisabled($radio, myData["disabled"]);
        if (!empty(myData["required"])) {
            $radio["required"] = true;
        }
        if (!empty(myData["form"])) {
            $radio["form"] = myData["form"];
        }

        $input = _templates.format("radio", [
            "name": $radio["name"],
            "value": $escape ? h($radio["value"]) : $radio["value"],
            "templateVars": $radio["templateVars"],
            "attrs": _templates.formatAttributes(
                $radio + myData,
                ["name", "value", "text", "options", "label", "val", "type"]
            ),
        ]);

        $label = _renderLabel(
            $radio,
            myData["label"],
            $input,
            $context,
            $escape
        );

        if (
            $label == false &&
            indexOf(_templates.get("radioWrapper"), "{{input}}") == false
        ) {
            $label = $input;
        }

        return _templates.format("radioWrapper", [
            "input": $input,
            "label": $label,
            "templateVars": myData["templateVars"],
        ]);
    }

    /**
     * Renders a label element for a given radio button.
     *
     * In the future this might be refactored into a separate widget as other
     * input types (multi-checkboxes) will also need labels generated.
     *
     * @param array<string, mixed> $radio The input properties.
     * @param array<string, mixed>|string|false $label The properties for a label.
     * @param string input The input widget.
     * @param uim.mvc.views\Form\IContext $context The form context.
     * @param bool $escape Whether to HTML escape the label.
     * @return string|false Generated label.
     */
    protected auto _renderLabel(array $radio, $label, $input, $context, $escape) {
        if (isSet($radio, "label")) {
            $label = $radio["label"];
        } elseif ($label == false) {
            return false;
        }
        $labelAttrs = is_array($label) ? $label : [];
        $labelAttrs += [
            "for": $radio["id"],
            "escape": $escape,
            "text": $radio["text"],
            "templateVars": $radio["templateVars"],
            "input": $input,
        ];

        return _label.render($labelAttrs, $context);
    }
}
