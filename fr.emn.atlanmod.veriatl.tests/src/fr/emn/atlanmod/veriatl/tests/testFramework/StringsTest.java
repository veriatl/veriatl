package fr.emn.atlanmod.veriatl.tests.testFramework;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import fr.emn.atlanmod.veriatl.tests.util.Strings;

public class StringsTest {

	@Test
	public void filename_emptyinput_isEmpty(){
		String res = Strings.filename("");
		assertTrue( res == "");
	}
	
	@Test
	public void filename_randominput_correct(){
		String res = Strings.filename("HSM.ecore");
		assertTrue( res.equals("HSM"));
	}
	
	@Test
	public void filename_null_isNull(){
		String res = Strings.filename(null);
		assertTrue( res == null);
	}
	
}
