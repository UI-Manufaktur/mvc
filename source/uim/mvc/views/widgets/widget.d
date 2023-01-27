/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.widgets;

@safe:
import uim.mvc;

/**
 * Basic input class.
 *
 * This input class can be used to render basic simple
 * input elements like hidden, text, email, tel and other types.
 */
class DWidget : IWidget {
    // StringTemplate instance.
    protected StringTemplate _templates;

    // Data defaults.
    protected Json defaults;

    /**
     * Constructor.
     *
     * templatesList -Templates list.
     */
    this(StringTemplate templatesList) {
        initialize;
        _templates = templatesList;
    }

    override void initialize() {
      super.initialize;

      defaults["name"] = "";
      defaults["val"] = null;
      defaults["type"] = "text";
      defaults["escape"] = true;
      defaults["templateVars"] = [];
    }
    /**
     * Render a text widget or other simple widget like email/tel/number.
     *
     * This method accepts a number of keys:
     *
     * - `name` The name attribute.
     * - `val` The value attribute.
     * - `escape` Set to false to disable escaping on all attributes.
     *
     * Any other keys provided in myData will be converted into HTML attributes.
     *
     * someData - The data to build an input with.
     * formContext - The current form context.
     */
    string render(Json someData, IContext formContext) {
        auto myData = this.mergeDefaults(someData, formContext);

        myData["value"] = myData["val"];
        unset(myData["val"]);
        if (myData["value"] == false) {
            // explicitly convert to 0 to avoid empty string which is marshaled as null
            myData["value"] = "0";
        }

        myFieldName = myData["fieldName"] ?? null;
        if (myFieldName) {
            if (myData["type"] == "number" && !myData.isSet("step")) {
                myData = this.setStep(myData, $context, myFieldName);
            }

            myTypesWithMaxLength = ["text", "email", "tel", "url", "search"];
            if (
                !array_key_exists("maxlength", myData)
                && hasAllValues(myData["type"], myTypesWithMaxLength, true)
            ) {
                myData = this.setMaxLength(myData, $context, myFieldName);
            }
        }

        return _templates.format("input", [
            "name": myData["name"],
            "type": myData["type"],
            "templateVars": myData["templateVars"],
            "attrs": _templates.formatAttributes(
                myData,
                ["name", "type"]
            ),
        ]);
    }

    /**
     * Merge default values with supplied data.
     *
     * @param array<string, mixed> myData Data array
     * @param uim.mvc.views\Form\IContext $context Context instance.
     * @return array<string, mixed> Updated data array.
     */
    protected Json mergeDefaults(Json myData, IContext aContext) {
        myData += _defaults;

        if (myData.isSet("fieldName") && !array_key_exists("required", myData)) {
            myData = this.setRequired(myData, $context, myData["fieldName"]);
        }

        return myData;
    }

    /**
     * Set value for "required" attribute if applicable.
     *
     * @param array<string, mixed> myData Data array
     * @param uim.mvc.views\Form\IContext $context Context instance.
     * @param string myFieldName Field name.
     * @return array<string, mixed> Updated data array.
     */
    protected array setRequired(Json myData, IContext aContext, string myFieldName) {
        if (
            empty(myData["disabled"])
            && (
                (myData.isSet("type"])
                    && myData["type"] != "hidden"
                )
                || !myData.isSet("type")
            )
            && $context.isRequired(myFieldName)
        ) {
            myData["required"] = true;
        }

        return myData;
    }

    /**
     * Set value for "maxlength" attribute if applicable.
     *
     * @param array<string, mixed> myData Data array
     * @param uim.mvc.views\Form\IContext $context Context instance.
     * @param string myFieldName Field name.
     * @return array<string, mixed> Updated data array.
     */
    protected array setMaxLength(Json myData, IContext aContext, string myFieldName) {
        $maxLength = $context.getMaxLength(myFieldName);
        if ($maxLength  !is null) {
            myData["maxlength"] = min($maxLength, 100000);
        }

        return myData;
    }

    /**
     * Set value for "step" attribute if applicable.
     *
     * @param array<string, mixed> myData Data array
     * @param uim.mvc.views\Form\IContext $context Context instance.
     * @param string myFieldName Field name.
     * @return array<string, mixed> Updated data array.
     */
    protected array setStep(Json myData, IContext aContext, string myFieldName) {
        $dbType = $context.type(myFieldName);
        myFieldDef = $context.attributes(myFieldName);

        if ($dbType == "decimal" && isSet(myFieldDef, "precision")) {
            $decimalPlaces = myFieldDef["precision"];
            myData["step"] = sprintf("%." ~ $decimalPlaces ~ "F", pow(10, -1 * $decimalPlaces));
        } elseif ($dbType == "float") {
            myData["step"] = "any";
        }

        return myData;
    }


    array secureFields(array myData) {
        if (!myData.isSet("name") || myData["name"] == "") {
            return [];
        }

        return [myData["name"]];
    }
}
