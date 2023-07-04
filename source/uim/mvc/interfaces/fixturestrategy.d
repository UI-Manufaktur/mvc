module uim.mvc.interfaces.fixturestrategy;

// Base interface for strategies used to manage fixtures for TestCase.
interface IFixtureStrategy {
    /**
     * Called before each test run in each TestCase.
     *
     * someFixtureNames Name of fixtures used by test.
     */
    void setupTest(string[] someFixtureNames);

    // Called after each test run in each TestCase.
    void teardownTest();
}
