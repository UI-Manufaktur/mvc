/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel (Sicherheitsschmiede)                                                      
**********************************************************************************************************/
module uim.mvc.views.widgets.interface_;

@safe:
import uim.mvc;

// Interface for input widgets.
interface IWidget {
  /**
    * Converts the myData into one or many HTML elements.
    *
    * someData - The data to render.
    * @param uim.mvc.views\Form\IContext $context The current form context.
    * @return string Generated HTML for the widget element.
    */
  string render(Json someData, IContext aContext);

  /**
    * Returns a list of fields that need to be secured for this widget.
    *
    * someData - The data to render.
    * @return Array of fields to secure.
    */
  string[] secureFields(Json someData);
}
