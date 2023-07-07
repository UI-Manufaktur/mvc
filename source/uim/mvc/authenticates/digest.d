module uim.mvc.authenticates.digest;

import uim.mvc;

@safe:
/**
 * Digest Authentication adapter for AuthComponent.
 *
 * Provides Digest HTTP authentication support for AuthComponent.
 *
 * ### Using Digest auth
 *
 * Load `AuthComponent` in your controller"s `initialize(DConfigurationValue configSettings = null)` and add "Digest" in "authenticate" key
 *
 * ```
 *  this.loadComponent("Auth", [
 *      "authenticate": ["Digest"],
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
 * Since HTTP Digest Authentication is stateless you don"t need call `setUser()`
 * in your controller. The user credentials will be checked on each request. If
 * valid credentials are not provided, required authentication headers will be sent
 * by this authentication provider which triggers the login dialog in the browser/client.
 *
 * ### Generating passwords compatible with Digest authentication.
 *
 * DigestAuthenticate requires a special password hash that conforms to RFC2617.
 * You can generate this password using `DigestAuthenticate::password()`
 *
 * ```
 * $digestPass = DigestAuthenticate::password($username, $password, env("SERVER_NAME"));
 * ```
 *
 * If you wish to use digest authentication alongside other authentication methods,
 * it"s recommended that you store the digest authentication separately. For
 * example `User.digest_pass` could be used for a digest password, while
 * `User.password` would store the password hash for use with other methods like
 * Basic or Form.
 *
 * @see https://book.cakephp.org/4/en/controllers/components/authentication.html
 */
class DDigestAuthenticate : DBasicAuthenticate {
}