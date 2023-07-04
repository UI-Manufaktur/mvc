# Package 📦 uim mvc.authentications.identifiers
##Identifiers¶

Identifiers will identify an user or service based on the information that was extracted from the request by the authenticators.
## Password¶

The password identifier checks the passed credentials against a datasource.

Configuration options:

fields: The fields for the lookup. Default is ['username': 'username', 'password': 'password']. You can also set the username to an array. For e.g. using ['username': ['username', 'email'], 'password': 'password'] will allow you to match value of either username or email columns.

resolver: The identity resolver. 

passwordHasher: Password hasher. Default is DefaultPasswordHasher::class.

Token
