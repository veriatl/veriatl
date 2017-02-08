package fr.emn.atlanmod.veriatl.tools;

import java.nio.file.Path;

/**
 * A specific {@link CommandBuilder} for Boogie.
 */
public class BoogieCommandBuilder extends AbstractCommandBuilder {

    /**
     * Constructs a new {@code BoogieCommandBuilder} on the given {@code path}.
     *
     * @param path the path of the {@link Command}
     */
    public BoogieCommandBuilder(Path path) {
        super(path);
    }

    

    /**
     * 
     *
     * @return a new command
     */
    public Command exec() {
        return build("boogie");
    }
}
