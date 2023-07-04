module uim.mvc.authenticates.form;

import uim.mvc;

@safe:
/**
 * Form authentication adapter for AuthComponent.
 *
 * Allows you to authenticate users based on form POST data.
 * Usually, this is a login form that users enter information into.
 *
 * ### Using Form auth
 *
 * Load `AuthComponent` in your controller"s `initialize(DConfigurationValue configSettings = null)` and add "Form" in "authenticate" key
 *
 * ```
 * this.loadComponent("Auth", [
 *     "authenticate": [
 *         "Form": [
 *             "fields": ["username": "email", "password": "passwd"],
 *             "finder": "auth",
 *         ]
 *     ]
 * ]);
 * ```
 *
 * When configuring FormAuthenticate you can pass in config to which fields, model and finder
 * are used. See `BaseAuthenticate::_defaultConfig` for more information.
 *
 * @see https://book.cakephp.org/4/en/controllers/components/authentication.html
 */
class DFormAuthenticate : DAuthenticate {
}
auto FormAuthenticate() { return new DFormAuthenticate; }