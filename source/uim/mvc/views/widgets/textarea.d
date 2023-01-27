module uim.mvc.views.widgets.textarea;

@safe:
import uim.mvc;
// use Traversable;

/**
 * Input widget class for generating a textarea control.
 *
 * This class is usually used internally by `Cake\View\Helper\FormHelper`,
 * it but can be used to generate standalone text areas.
 */
class DMVCTextareaWidget : DWidget {
  override void initialize() {
    super.initialize;
    
    _defaults["val"] = "";
    _defaults["name"] = "";
    _defaults["escape"] = true;
    _defaults["rows"] = 5;
    _defaults["templateVars"] = [];
  }

  /**
    * Render a text area form widget.
    *
    * Data supports the following keys:
    *
    * - `name` - Set the input name.
    * - `val` - A string of the option to mark as selected.
    * - `escape` - Set to false to disable HTML escaping.
    *
    * All other keys will be converted into HTML attributes.
    *
    * @param array<string, mixed> myData The data to build a textarea with.
    * @param uim.mvc.views\Form\IContext $context The current form context.
    * returns HTML string
    */
  string render(Json someData, IContext aContext) {
      myData += this.mergeDefaults(someData, aContext);

      if (!myData.isSet("maxlength") && myData.isSet("fieldName")) {
          myData = this.setMaxLength(myData, $context, myData["fieldName"]);
      }

      return _templates.format("textarea", [
          "name": myData["name"],
          "value": myData["escape"] ? h(myData["val"]) : myData["val"],
          "templateVars": myData["templateVars"],
          "attrs": _templates.formatAttributes(
              myData,
              ["name", "val"]
          ),
      ]);
  }
}
