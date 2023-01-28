module uim.mvc.views.widgets.multicheckbox;

@safe:
import uim.mvc;

/**
 * Input widget class for generating multiple checkboxes.
 *
 * This class is usually used internally by `DFormHelper`,
 * it but can be used to generate standalone multiple checkboxes.
 */
class DMVCMultiCheckboxWidget : DWidget {
  // use IdGeneratorTrait;

  override void initialize() {
    super.initialize;
    
    _defaults["name"] = "";
    _defaults["escape"] = true;
    _defaults["options"] = [];
    _defaults["disabled"] = null;
    _defaults["val"] = null;
    _defaults["idPrefix"] = null;
    _defaults["templateVars"] = [];
    _defaults["label"] = true;
  }

    // Label widget instance.
    protected DWidget\LabelWidget _label;

    /**
     * Render multi-checkbox widget.
     *
     * This class uses the following templates:
     *
     * - `checkbox` Renders checkbox input controls. Accepts
     *   the `name`, `value` and `attrs` variables.
     * - `checkboxWrapper` Renders the containing div/element for
     *   a checkbox and its label. Accepts the `input`, and `label`
     *   variables.
     * - `multicheckboxWrapper` Renders a wrapper around grouped inputs.
     * - `multicheckboxTitle` Renders the title element for grouped inputs.
     *
     * @param uim.mvc.views\StringTemplate myTemplates Templates list.
     * @param uim.mvc.views\Widget\LabelWidget $label Label widget instance.
     */
    this(StringTemplate myTemplates, DMVCLabelWidget aLabel) {
        _templates = myTemplates;
        _label = aLabel;
    }

    override void initialize() {
      super.initialize;
    }
    /**
     * Render multi-checkbox widget.
     *
     * Data supports the following options.
     *
     * - `name` The name attribute of the inputs to create.
     *   `[]` will be appended to the name.
     * - `options` An array of options to create checkboxes out of.
     * - `val` Either a string/integer or array of values that should be
     *   checked. Can also be a complex options set.
     * - `disabled` Either a boolean or an array of checkboxes to disable.
     * - `escape` Set to false to disable HTML escaping.
     * - `options` An associative array of value=>labels to generate options for.
     * - `idPrefix` Prefix for generated ID attributes.
     *
     * ### Options format
     *
     * The options option can take a variety of data format depending on
     * the complexity of HTML you want generated.
     *
     * You can generate simple options using a basic associative array:
     *
     * ```
     * "options": ["elk": "Elk", "beaver": "Beaver"]
     * ```
     *
     * If you need to define additional attributes on your option elements
     * you can use the complex form for options:
     *
     * ```
     * "options": [
     *   ["value": "elk", "text": "Elk", "data-foo": "bar"],
     * ]
     * ```
     *
     * This form **requires** that both the `value` and `text` keys be defined.
     * If either is not set options will not be generated correctly.
     *
     * @param array<string, mixed> myData The data to generate a checkbox set with.
     * @param uim.mvc.views\Form\IContext $context The current form context.
     */
    string render(Json someData, IContext aContext) {
        myData += this.mergeDefaults(someData, aContext);

        _idPrefix = myData["idPrefix"];
        _clearIds();

        return implode("", _renderInputs(myData, $context));
    }

    /**
     * Render the checkbox inputs.
     *
     * @param array<string, mixed> myData The data array defining the checkboxes.
     * @param uim.mvc.views\Form\IContext $context The current form context.
     * @return An array of rendered inputs.
     */
    protected string[] _renderInputs(Json myData, IContext aContext) {
        $out = null;
        foreach (myData["options"] as myKey: $val) {
            // Grouped inputs in a fieldset.
            if (is_string(myKey) && is_array($val) && !isSet($val, "text", "value")) {
                $inputs = _renderInputs(["options": $val] + myData, $context);
                $title = _templates.format("multicheckboxTitle", ["text": myKey]);
                $out ~= _templates.format("multicheckboxWrapper", [
                    "content": $title . implode("", $inputs),
                ]);
                continue;
            }

            // Standard inputs.
            $checkbox = [
                "value": myKey,
                "text": $val,
            ];
            if (is_array($val) && isSet($val, "text", "value")) {
                $checkbox = $val;
            }
            if (!isSet($checkbox["templateVars"])) {
                $checkbox["templateVars"] = myData["templateVars"];
            }
            if (!isSet($checkbox, "label")) {
                $checkbox["label"] = myData["label"];
            }
            if (!empty(myData["templateVars"])) {
                $checkbox["templateVars"] = array_merge(myData["templateVars"], $checkbox["templateVars"]);
            }
            $checkbox["name"] = myData["name"];
            $checkbox["escape"] = myData["escape"];
            $checkbox["checked"] = _isSelected((string)$checkbox["value"], myData["val"]);
            $checkbox["disabled"] = _isDisabled((string)$checkbox["value"], myData["disabled"]);
            if (empty($checkbox["id"])) {
                if (myData.isSet("id"])) {
                    $checkbox["id"] = myData["id"] ~ "-" ~ trim(
                        _idSuffix((string)$checkbox["value"]),
                        "-"
                    );
                } else {
                    $checkbox["id"] = _id($checkbox["name"], (string)$checkbox["value"]);
                }
            }
            $out ~= _renderInput($checkbox + myData, $context);
        }

        return $out;
    }

    /**
     * Render a single checkbox & wrapper.
     *
     * @param array<string, mixed> $checkbox An array containing checkbox key/value option pairs
     * @param uim.mvc.views\Form\IContext $context Context object.
     * @return string
     */
    protected string _renderInput(array $checkbox, IContext $context) {
        $input = _templates.format("checkbox", [
            "name": $checkbox["name"] ~ "[]",
            "value": $checkbox["escape"] ? h($checkbox["value"]) : $checkbox["value"],
            "templateVars": $checkbox["templateVars"],
            "attrs": _templates.formatAttributes(
                $checkbox,
                ["name", "value", "text", "options", "label", "val", "type"]
            ),
        ]);

        if ($checkbox["label"] == false && indexOf(_templates.get("checkboxWrapper"), "{{input}}") == false) {
            $label = $input;
        } else {
            $labelAttrs = is_array($checkbox["label"]) ? $checkbox["label"] : [];
            $labelAttrs += [
                "for": $checkbox["id"],
                "escape": $checkbox["escape"],
                "text": $checkbox["text"],
                "templateVars": $checkbox["templateVars"],
                "input": $input,
            ];

            if ($checkbox["checked"]) {
                $selectedClass = _templates.format("selectedClass", []);
                $labelAttrs = (array)_templates.addClass($labelAttrs, $selectedClass);
            }

            $label = _label.render($labelAttrs, $context);
        }

        return _templates.format("checkboxWrapper", [
            "templateVars": $checkbox["templateVars"],
            "label": $label,
            "input": $input,
        ]);
    }

    /**
     * Helper method for deciding what options are selected.
     *
     * @param string myKey The key to test.
     * @param array<string>|string|int|false|null $selected The selected values.
     */
    protected bool _isSelected(string myKey, $selected) {
        if ($selected is null) {
            return false;
        }
        if (!is_array($selected)) {
            return myKey == (string)$selected;
        }
        $strict = !is_numeric(myKey);

        return hasAllValues(myKey, $selected, $strict);
    }

    /**
     * Helper method for deciding what options are disabled.
     *
     * @param string myKey The key to test.
     * @param mixed $disabled The disabled values.
     */
    protected bool _isDisabled(string myKey, $disabled) {
        if ($disabled is null || $disabled == false) {
            return false;
        }
        if ($disabled == true || is_string($disabled)) {
            return true;
        }
        $strict = !is_numeric(myKey);

        return hasAllValues(myKey, $disabled, $strict);
    }
}
