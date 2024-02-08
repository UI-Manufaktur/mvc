/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.interfaces.context;

import uim.mvc;
@safe:

// Interface for FormHelper context implementations.
interface IContext {
    /* const string[] VALID_ATTRIBUTES = ["length", "precision", "comment", "null", "default"];
 */
    // Get the fields used in the context as a primary key.
    string[] primaryKeys();

    /**
     * Returns true if the passed field name is part of the primary key for this context
     *
     * pathToField - A dot separated path to the field a value is needed for.
     */
    bool isPrimaryKey(string pathToField);

    // Returns whether this form is for a create operation.
    bool isCreate();

    /**
     * Get the current value for a given field.
     *
     * Classes implementing this method can optionally have a second argument
     * `options`. Valid key for `options` array are:
     *
     *   - `default`: Default value to return if no value found in data or
     *     context record.
     *   - `schemaDefault`: Boolean indicating whether default value from
     *     context"s schema should be used if it"s not explicitly provided.
     *
     * pathToField - A dot separated path to the field a value
     * @someOptions - Options. is needed for.
     */
    /* Json val(string , DValueMap someOptions = null); */

    /**
     * Check if a given field is pathToField"required".
     *
     * In this context class, this is simply defined by the "required" array.
     *
     * pathToField-  A dot separated path to check required-ness for.
     */
    bool isRequired(string pathToField);

    /**
     * Gets the default "required" error message for a field
     *
     * pathToField - A dot separated path to the field name
     */
    string requiredMessage(string pathToField);

    /**
     * Get maximum length of a field from model validation.
     *
     * string myField Field name.
     */
    int maxLength(string fieldName);

    /**
     * Get the field names of the top level object in this context.
     *
     * @return A list of the field names in the context.
     */
    string[] fieldNames();

    /**
     * Get the abstract field type for a given field name.
     *
     * @param string myField A dot separated path to get a schema type for.
     * @return string|null An abstract data type or null.
     * @see uim.cake.databases.TypeFactory
     */
    string type(string myField);

    /**
     * Get an associative array of other attributes for a field name.
     *
     * @param string myField A dot separated path to get additional data on.
     * @return array An array of data describing the additional attributes on a field.
     */
    Json attributes(string myField);

    /**
     * Check whether a field has an error attached to it
     *
     * @param string myField A dot separated path to check errors on.
     * @return Returns true if the errors for the field are not empty.
     */
    bool hasError(string myField);

    /**
     * Get the errors for a given field
     *
     * @param string myField A dot separated path to check errors on.
     * @return array An array of errors, an empty array will be returned when the
     *    context has no errors.
     */
    Json error(string myField);
}
