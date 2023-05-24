## JWT¶

The JWT authenticator gets the JWT token from the header or query param and either returns the payload directly or passes it to the identifiers to verify them against another datasource for example.

- header: The header line to check for the token. The default is Authorization.


- queryParam: The query param to check for the token. The default is token.

- tokenPrefix: The token prefix. Default is bearer.

- algorithm: The hashing algorithm for Firebase JWT. Default is 'HS256'.

- returnPayload: To return or not return the token payload directly without going through the identifiers. Default is true.

- secretKey: Default is null but you’re required to pass a secret key if you’re not in the context of a CakePHP application that provides it through Security::salt().

- jwks: Default is null. Associative array with a 'keys' key. If provided will be used instead of the secret key.
