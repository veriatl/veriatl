package fr.emn.atlanmod.veriatl.tools;

import java.util.ArrayList;

import fr.emn.atlanmod.veriatl.core.VerificationResult;

/**
 * A command-line that can be executed.
 */
@FunctionalInterface
public interface Command {

    /**
     * Executes this {@code Command} with the given {@code args}.
     *
     * @param args the arguments of the command to be executed
     *
     * @return the result of the execution ({@code 0 = success}
     */
    VerificationResult execute(ArrayList<String> args);
}
