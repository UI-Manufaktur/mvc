/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.widget;

import uim.mvc;
@safe:

// Interface for input widgets.
interface IWidget {
  /**
    * Converts the myData into one or many HTML elements.
    *
    * someData - The data to render.
    * formContext - The current form context.
    * returns string Generated HTML for the widget element.
    */
  string render(Json someData, IContext formContext);

  /**
    * Returns a list of fields that need to be secured for this widget.
    *
    * someData - The data to render.
    * returns Array of fields to secure.
    */
  string[] secureFields(Json someData);
}
