package fr.emn.atlanmod.veriatl.core;

/**
 * Represents the verification mode of VeriATL.
 */
public enum IncMode {
	// enable inc mode
	ENABLE("enable"),
	// disable inc mode
    DISABLE("disable");	

	
    private final String name;

    IncMode(String name) {
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
