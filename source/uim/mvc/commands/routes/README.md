# Package 📦 uim.mvc.commands.routes

## Authenticators

Authenticators handle converting request data into an authentication operations. They leverage Identifiers to find a known Identity Objects.

### Session

This authenticator will check the session if it contains user data or credentials. When using any stateful authenticators like Form listed below, be sure to load Session authenticator first so that once logged in user data is fetched from session itself on subsequent requests.

### Token

The token authenticator can authenticate a request based on a token that comes along with the request in the headers or in the request parameters.

Configuration options:

queryParam: Name of the query parameter. Configure it if you want to get the token from the query parameters.

header: Name of the header. Configure it if you want to get the token from the header.

tokenPrefix: The optional token prefix.
