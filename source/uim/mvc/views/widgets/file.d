/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.widgets.file;

@safe:
import uim.mvc;

/**
 * Input widget class for generating a file upload control.
 *
 * This class is usually used internally by `Cake\View\Helper\FormHelper`,
 * it but can be used to generate standalone file upload controls.
 */
class FileWidget : DWidget {
  override void initialize(Json configSetting = Json(null)) {
    super.initialize(configSettings);
        
    _defaults["name"] = "";
    _defaults["escape"] = true;
    _defaults["templateVars"] = [];
  }

  /**
    * Render a file upload form widget.
    *
    * Data supports the following keys:
    *
    * - `name` - Set the input name.
    * - `escape` - Set to false to disable HTML escaping.
    *
    * All other keys will be converted into HTML attributes.
    * Unlike other input objects the `val` property will be specifically
    * ignored.
    *
    * @param array<string, mixed> myData The data to build a file input with.
    * @param uim.mvc.views\Form\IContext $context The current form context.
    * returns HTML string
    */
  string render(Json someData, IContext aContext) {
    auto myData += this.mergeDefaults(someData, aContext);

    unset(myData["val"]);

    return _templates.format("file", [
      "name": myData["name"],
      "templateVars": myData["templateVars"],
      "attrs": _templates.formatAttributes(
          myData,
          ["name"]
      ),
    ]);
  }

  
  array secureFields(array myData) {
    // PSR7 UploadedFileInterface objects are used.
    if (Configure::read("App.uploadedFilesAsObjects", true)) {
        return [myData["name"]];
    }

    // Backwards compatibility for array files.
    myFields = null;
    foreach (["name", "type", "tmp_name", "error", "size"] as $suffix) {
        myFields ~= myData["name"] ~ "[" ~ $suffix ~ "]";
    }

    return myFields;
  }
}
