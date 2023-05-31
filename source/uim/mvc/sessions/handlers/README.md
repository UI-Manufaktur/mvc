# Library 📦 uim.mvc.sessions.handlers

The above overrides the timeout and cookie name for the vibe session configuration. The built-in configuration are:

- file - Saves sessions as files inside tmp/sessions. This is a good option when on hosts that don’t allow you to write outside your own home dir.
- database - Use the built-in database sessions. S
- cache Manage sesins in cache

## File Sessions

## Database Sessions

If you need to use a database to store your session data

## Cache Sessions

The Cache class can be used to store sessions. This allow to store sessions in memory.
