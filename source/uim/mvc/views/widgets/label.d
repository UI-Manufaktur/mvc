/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.widgets.label;

@safe:
import uim.mvc;

/**
 * Form "widget" for creating labels.
 *
 * Generally this element is used by other widgets,
 * and FormHelper itself.
 */
class DMVCLabelWidget : IWidget {
  // Templates
  protected DStringTemplate _templates;

  // The template to use.
  protected string _labelTemplate = "label";

  /**
    * Constructor.
    *
    * This class uses the following template:
    *
    * - `label` Used to generate the label for a radio button.
    *   Can use the following variables `attrs`, `text` and `input`.
    *
    * templatesList -Templates list.
    */
  this(StringTemplate templatesList) {
    _templates = templatesList;
  }

  void initialize(DConfig configSettings = null) {
    super.initialize(configSettings);
  }
  
  /**
    * Render a label widget.
    *
    * Accepts the following keys in myData:
    *
    * - `text` The text for the label.
    * - `input` The input that can be formatted into the label if the template allows it.
    * - `escape` Set to false to disable HTML escaping.
    *
    * All other attributes will be converted into HTML attributes.
    *
    * @param array<string, mixed> myData Data array.
    * @param uim.mvc.views\Form\IContext $context The current form context.
    */
  string render(Json someData, IContext aContext) {
        someData["text"] = "";
        someData["input"] = "";
        someData["hidden"] = "";
        someData["escape"] = true;
        someData["templateVars"] = [];

    return _templates.format(_labelTemplate, [
        "text": myData["escape"] ? h(myData["text"]) : myData["text"],
        "input": myData["input"],
        "hidden": myData["hidden"],
        "templateVars": myData["templateVars"],
        "attrs": _templates.formatAttributes(myData, ["text", "input", "hidden"]),
    ]);
  }

  
  array secureFields(array myData) {
      return [];
  }
}
