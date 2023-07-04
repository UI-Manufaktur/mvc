module uim.mvc.interfaces.collectionaware;

// An interface for shells that take a CommandCollection during initialization.
interface ICommandCollectionAware {
	// Set the command collection being used.
	void commandCollection(CommandCollection newCommands);
	CommandCollection commandCollection();
}
