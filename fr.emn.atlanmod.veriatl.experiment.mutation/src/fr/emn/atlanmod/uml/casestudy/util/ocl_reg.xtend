package fr.emn.atlanmod.uml.casestudy.util

import java.io.BufferedReader
import java.io.File
import java.io.FileInputStream
import java.io.InputStreamReader
import java.nio.charset.Charset
import java.io.PrintStream
import java.io.FileOutputStream

class ocl_reg {

	def public static main(String[] args) {

		var String line;

		var fis = new FileInputStream("./resources/UML3.ocl");
		val isr = new InputStreamReader(fis, Charset.forName("UTF-8"));
		val br = new BufferedReader(isr);

		System.setOut(new PrintStream(new FileOutputStream("./resources/UML4.ocl")))
		while ((line = br.readLine()) != null) {
			
			if(!line.startsWith("package ") && !line.startsWith("endpackage")){
				if(line.contains("context ")){
					val clazz = line.split("::").last
					println(String.format("context %s", clazz))
				}else{
					println(line)
				}
				

			}

		}
	}

}

