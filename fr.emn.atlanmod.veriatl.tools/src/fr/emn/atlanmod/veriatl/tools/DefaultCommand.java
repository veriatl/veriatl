package fr.emn.atlanmod.veriatl.tools;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;



/**
 * A default {@link Command} that executes a program using {@link ProcessBuilder}s and {@link Process}s.
 * <p>
 * The program output is redirected to the console.
 */
public class DefaultCommand implements Command {

    /**
     * The path to the execution of the command.
     */
    private final Path path;

    /**
     * The program to execute.
     */
    private final String executable;

    /**
     * Constructs a new {@code DefaultCommand} on the given {@code path} with the specified {@code program}.
     *
     * @param path       the path to the execution of the command
     * @param executable the program to execute
     */
    protected DefaultCommand(Path path, String executable) {
        this.path = path;
        this.executable = executable;
    }


    /**
     * Execute Boogie with the given {@code args}.
     * 
     * @return VerificationResult, with status, boogie output, and execution time.
     * 
     * @see fr.emn.atlanmod.veriatl.tools.VerificationResult
     * */
    @Override
    public VerificationResult execute(ArrayList<String>  args) {
        List<String> command = new ArrayList<>();
         
        command.add(path.resolve(executable).toString());
        command.addAll(args);

        
        ProcessBuilder pb = new ProcessBuilder()
                .command(command)
                .directory(path.toFile())
                .redirectErrorStream(true);


        Process process = null;
        
        VerificationResult r;
        
        try {
        	long start = System.currentTimeMillis();
            process = pb.start();
            int exitValue = process.waitFor();
            long end = System.currentTimeMillis();
            long time = end - start;
          
            if (exitValue != 0) {
            	BufferedReader input = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            	String cmd = "";
				String line;
				
				while ((line = input.readLine()) != null) {
					//System.out.println(line);
					cmd += String.format("    > %s", line);			
				}
				
				r = new VerificationResult("ERROR", cmd, time);
				
            }else{
				BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
				String boogieRes = "false";

				String line;
				while ((line = input.readLine()) != null) {
					System.out.println(line);
					if(line.indexOf("Boogie program verifier finished") != -1){
						if (line.indexOf("inconclusive") != -1) {
							boogieRes = "inconclusive";
						} else if (line.indexOf("time out") != -1){
							boogieRes = "time_out";
						} else{
							if (line.indexOf(", 0 errors") != -1) {
								boogieRes = "true";	
							}
						}
						break;
					}
					
				}

				input.close();
				
				r = new VerificationResult("OK", boogieRes, time);
            }
            
            return r;
        }
        catch (IOException e) {
            return new VerificationResult("IOError", e.getStackTrace().toString(), -1);
        }
        catch (InterruptedException e) {
            e.printStackTrace();
            process.destroyForcibly();
            return new VerificationResult("INTERUPTED", e.getStackTrace().toString(), -1);
        }
    }
}
