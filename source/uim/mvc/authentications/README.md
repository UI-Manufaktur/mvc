# Package 📦 uim mvc.authentications

## Authenticators
Authenticators handle converting request data into an authentication operations. They leverage Identifiers to find a known Identity Objects.

### Session
This authenticator will check the session if it contains user data or credentials. When using any stateful authenticators like Form listed below, be sure to load Session authenticator first so that once logged in user data is fetched from session itself on subsequent requests.
