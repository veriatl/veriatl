package fr.emn.atlanmod.veriatl.experiment.execevo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import fr.emn.atlanmod.veriatl.tools.Command;
import fr.emn.atlanmod.veriatl.tools.VerificationResult;



/**
 * A default {@link Command} that executes a program using {@link ProcessBuilder}s and {@link Process}s.
 * <p>
 * The program output is redirected to the console.
 */
public class DefaultCommandEvo {

	private static String boogie = "../fr.emn.atlanmod.veriatl.tools/lib/Boogie-2.3.0/win-64/boogie.exe";
	

    public static VerificationResult execute(ArrayList<String>  args) {
        List<String> command = new ArrayList<>();
         
        command.add(boogie);
        command.addAll(args);

        
        ProcessBuilder pb = new ProcessBuilder()
                .command(command)
                .redirectErrorStream(true);


        Process process = null;
        
        VerificationResult r;
        
        try {
            process = pb.start();
            int exitValue = process.waitFor();

           
            
            if (exitValue != 0) {
            	BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));

				String line;
				while ((line = input.readLine()) != null) {
					System.out.println(line);				
				}
				
                throw new RuntimeException("The execution ended with an error: " + exitValue + ". See the trace for more information");
            }else{
				BufferedReader input = new BufferedReader(new InputStreamReader(process.getInputStream()));
				String boogieRes = "false";

				ArrayList<Double> times = new ArrayList<Double>();
				
				String line;
				while ((line = input.readLine()) != null) {
					//System.out.println(line);
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
						//break;
					}
					if(line.indexOf("Finished implementation verification") != -1){
						String t = line.replaceAll("[^0-9,]+", " ");
						t = t.replace(",", ".").trim();
						times.add(Double.parseDouble(t));
					}
				}

				input.close();
				
				long time = 0;
				if(times.size() >= 2){
					time = (int) ((times.get(times.size()-1) - times.get(times.size()-2)) * 1000);
				}else{
					time = (int) ( (times.get(times.size()-1) * 1000) );
				}
				
				r = new VerificationResult("OK", boogieRes, time);
            }
            
            return r;
        }
        catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        catch (InterruptedException e) {
            e.printStackTrace();
            process.destroyForcibly();
            return new VerificationResult("INTERUPTED", "error", -1);
        }
    }
}
