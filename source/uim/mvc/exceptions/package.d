/*********************************************************************************************************
	Copyright: © 2015-2023 Ozan Nurettin Süel (Sicherheitsschmiede)                                        
	License: Subject to the terms of the Apache 2.0 license, as written in the included LICENSE.txt file.  
	Authors: Ozan Nurettin Süel, mailto:ons@sicherheitsschmiede.de                                                      
**********************************************************************************************************/
module uim.mvc.exceptions;

/**
 * Base class that all UIM Exceptions extend.
 *
 * @method int getCode() Gets the Exception code.
 */
class DUIMException /* : RuntimeException */ {
    /**
     * Array of attributes that are passed in from the constructor, and
     * made available in the view when a development error is displayed.
     */
    /* protected array _attributes = null; */

    // --- protected string _messageTemplate = "";

    /**
     * Array of headers to be passed to {@link uim.cake.Http\Response::withHeader()}
     *
     * @var array|null
     */
    /* protected _responseHeaders; */

    // --- protected int _defaultCode = 0;

    /**
     * Constructor.
     *
     * Allows you to create exceptions that are treated as framework errors and disabled
     * when debug mode is off.
     *
     * @param array|string myMessage Either the string of the error message, or an array of attributes
     *   that are made available in the view, and sprintf()"d into Exception::_messageTemplate
     * @param int|null $code The error code
     * @param \Throwable|null $previous the previous exception.
     */
/*     this(myMessage = "", Nullable!int aCcode = null, ?Throwable $previous = null) {
      if (is_array(myMessage)) {
        _attributes = myMessage;
        myMessage = vsprintf(_messageTemplate, myMessage);
      }
      super(myMessage, $code ?? _defaultCode, $previous);
    }

    // Get the passed in attributes
    array attributes() {
      return _attributes;
    } */

    /**
     * Get/set the response header to be used
     *
     * See also {@link uim.cake.Http\Response::withHeader()}
     *
     * @param array|string|null $header A single header string or an associative
     *   array of "header name":"header value"
     * @param string|null myValue The header value.
     * @return array|null
     * @deprecated 4.2.0 Use `HttpException::setHeaders()` instead. Response headers
     *   should be set for HttpException only.
     */
    /* function responseHeader($header = null, myValue = null): ?array {
      if ($header is null) {
          return _responseHeaders;
      }

      deprecationWarning(
          "Setting HTTP response headers from Exception directly is deprecated~ " ~
          "If your exceptions extend Exception, they must now extend HttpException~ " ~
          "You should only set HTTP headers on HttpException instances via the `setHeaders()` method."
      );
      if (is_array($header)) {
          return _responseHeaders = $header;
      }

      return _responseHeaders = [$header: myValue];
    } */
}
