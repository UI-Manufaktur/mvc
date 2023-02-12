module uim.mvc.views.widgets;

@safe:
import uim.mvc;

/**
 * Input widget class for generating a calendar year select box.
 *
 * This class is usually used internally by `Cake\View\Helper\FormHelper`,
 * it but can be used to generate standalone calendar year select boxes.
 */
class DMVCYearWidget : DWidget {
  override void initialize(DConfig configSetting = null) {
    super.initialize(configSettings);
        
    _defaults["name"] = "";
    _defaults["val"] = null;
    _defaults["min"] = null;
    _defaults["max"] = null;
    _defaults["order"] = "desc";
    _defaults["templateVars"] = [];
  }

  // Select box widget.
  protected DWidget\SelectBoxWidget_select;

  /**
    * Constructor
    *
    * @param uim.mvc.views\StringTemplate myTemplates Templates list.
    * @param uim.mvc.views\Widget\SelectBoxWidget $selectBox Selectbox widget instance.
    */
  this(StringTemplate myTemplates, SelectBoxWidget $selectBox) {
      _select = $selectBox;
      _templates = myTemplates;
  }

  /**
    * Renders a year select box.
    *
    * @param array<string, mixed> myData Data to render with.
    * @param uim.mvc.views\Form\IContext $context The current form context.
    * @return A generated select box.
    */
  string render(Json someData, IContext aContext) {
      myData += this.mergeDefaults(someData, aContext);

      if (empty(myData["min"])) {
          myData["min"] = date("Y", strtotime("-5 years"));
      }

      if (empty(myData["max"])) {
          myData["max"] = date("Y", strtotime("+5 years"));
      }

      myData["min"] = (int)myData["min"];
      myData["max"] = (int)myData["max"];

      if (myData["val"] instanceof IDateTime) {
          myData["val"] = myData["val"].format("Y");
      }

      if (!empty(myData["val"])) {
          myData["min"] = min((int)myData["val"], myData["min"]);
          myData["max"] = max((int)myData["val"], myData["max"]);
      }

      if (myData["max"] < myData["min"]) {
          throw new InvalidArgumentException("Max year cannot be less than min year");
      }

      if (myData["order"] == "desc") {
          myData["options"] = range(myData["max"], myData["min"]);
      } else {
          myData["options"] = range(myData["min"], myData["max"]);
      }
      myData["options"] = array_combine(myData["options"], myData["options"]);

      unset(myData["order"], myData["min"], myData["max"]);

      return _select.render(myData, $context);
  }
}
