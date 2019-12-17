package fr.emn.atlanmod.veriatl.core;

/**
 * Represents the verification mode of VeriATL.
 */
public enum Mode {
	// execute ATL transformation
	EXEC("test"),
	// generate Boogie code for mm, tr, pre, post, subs, aux
    GEN("genBoogie"),		
    // verify a postcondition
    VERIFY("verify"),
    // debug a postcondition by verifying its sub-goals
	DEBUG("debug");
	
    private final String name;

    Mode(String name) {
        this.name = name;
    }

    /**
     * Returns a literal description of this mode.
     *
     * @return the literal description
     */
    public String getName() {
        return name;
    }
}
