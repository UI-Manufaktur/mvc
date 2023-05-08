module uim.mvc.interfaces.formatter;

import uim.mvc;
@safe:

interface IFormatter : IMVCObject {
  /**
  * Returns a string with all passed variables interpolated into the original message.
  *
  * messageLocale - The locale in which the message is presented.
  * messageToTranslate - The message to be translated
  * tokenValues - The list of values to interpolate in the message
  * returns the formatted message
  */
  string format(string messageLocale, string messageToTranslate, STRINGAA tokenValues);
}