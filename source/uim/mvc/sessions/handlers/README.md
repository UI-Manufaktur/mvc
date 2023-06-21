# Library 📦 uim.mvc.sessions.handlers

The above overrides the timeout and cookie name for the vibe session configuration. The built-in configuration are:

- file - Saves sessions as files inside tmp/sessions. This is a good option when on hosts that don’t allow you to write outside your own home dir.
- database - Use the built-in database sessions. S
- cache Manage sessions in cache

## File Sessions

DFileSessionHandler

## Database Sessions

DDatabaseSessionHandler

If you need to use a database to store your session data. Choose your preferred database and connect with the handler.

## Cache Sessions

The DCacheSessionHandler class can be used to store sessions. This allow to store sessions in memory.
