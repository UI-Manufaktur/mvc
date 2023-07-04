module source.uim.mvc.authenticates.basic;

import uim.mvc;

@safe:
/**
 * Basic Authentication adapter for AuthComponent.
 *
 * Provides Basic HTTP authentication support for AuthComponent. Basic Auth will
 * authenticate users against the configured userModel and verify the username
 * and passwords match.
 *
 * ### Using Basic auth
 *
 * Load `AuthComponent` in your controller"s `initialize(DConfigurationValue configSettings = null)` and add "Basic" in "authenticate" key
 * ```
 *  this.loadComponent("Auth", [
 *      "authenticate": ["Basic"]
 *      "storage": "Memory",
 *      "unauthorizedRedirect": false,
 *  ]);
 * ```
 *
 * You should set `storage` to `Memory` to prevent UIM from sending a
 * session cookie to the client.
 *
 * You should set `unauthorizedRedirect` to `false`. This causes `AuthComponent` to
 * throw a `ForbiddenException` exception instead of redirecting to another page.
 *
 * Since HTTP Basic Authentication is stateless you don"t need call `setUser()`
 * in your controller. The user credentials will be checked on each request. If
 * valid credentials are not provided, required authentication headers will be sent
 * by this authentication provider which triggers the login dialog in the browser/client.
 *
 * @see https://book.cakephp.org/4/en/controllers/components/authentication.html
 */
class DBasicAuthenticate : DAuthenticate {
}