package datastructure;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Map;

import org.apache.commons.io.FileUtils;

import runtime.executioner;

public class NodeHelper {

	
	public static Node findRoot(ArrayList<Node> tree){
		for(Node n : tree){
			if(n.parent == null){
				return n;
			}
		}
		return null;
	}
	

	
	
	public static ArrayList<Node> findLeafs(ArrayList<Node> tree){
		
		ArrayList<Node> nonLeafs = new ArrayList<Node>();
		ArrayList<Node> Leafs = new ArrayList<Node>();
		
		for(Node n : tree){
			if(n.parent != null){
				nonLeafs.add(n.parent);
			}
		}
		
		for(Node n: tree){
			if(!nonLeafs.contains(n)){
				Leafs.add(n);
			}
		}
		
		return Leafs;
		
	}

	public static ArrayList<Node> findChildren(Node parent, ArrayList<Node> tree) {
		ArrayList<Node> children =  new ArrayList<Node>();
		
		for(Node n : tree){
			if(n.parent == parent){
				children.add(n);
			}
		}
		
		return children;
	}

	public static Node findSimplifiedPost(ArrayList<Node> vTree) {
		Node r = findRoot(vTree);
		
		ArrayList<Node> children = findChildren(r, vTree);
		
		int count = 0;
		Node next = null;
		
		if(r.getResult() == TriBoolean.UNKNOWN){
			for(Node n : children){
				if(n.getResult() == TriBoolean.UNKNOWN){
					count++;
					next = n;
				}		
			}
			
			if(count == 1){
				ArrayList<Node> temp = new ArrayList<Node>(vTree);
				temp.remove(r);
				temp.removeAll(children);
				next.backUpParent = next.parent;
				next.parent = null;
				temp.add(next);
				return findSimplifiedPost(temp);
			}else {
				return r;	
			}
		}else{
			return r.getParent();
		}
		
		

	}

	public static TriBoolean repopulate(Node n, ArrayList<Node> vTree) {
		normalizeTree(vTree);
		Node r = findRoot(vTree);
		
		while(r.getResult() == TriBoolean.UNKNOWN){
			Node s = findSimplifiedPost(vTree);	
			TriBoolean res = TriBoolean.compute(findChildren(s, vTree));
			s.setResult(res);	
			normalizeTree(vTree);
		}
		
		return r.getResult();
	}

	private static void normalizeTree(ArrayList<Node> tree) {
		for(Node n : tree){
			if(n.getBackUpParent()!=null){
				n.setParent(n.getBackUpParent());
				n.setBackUpParent(null);
			}
		}	
	}




	public static String printTree(String tarProj, String post, ArrayList<Node> tree) throws Exception {
		String p = post.replace("/", "");
		String folder = String.format("%s/Trees/", tarProj);
		FileUtils.forceMkdir(new File(folder));
		
		PrintStream original = new PrintStream(System.out);
		String file = String.format("%s/Trees/%s", tarProj, p);
		
		String fileName = String.format("%s.gv", file);
		PrintStream out = new PrintStream(new FileOutputStream(fileName));
		System.setOut(out);
		
		String content = "digraph G {\n";
		
		for(Node n : tree){
			if(n.parent!=null){
				content += String.format("\t%s_%s -> %s_%s;\n", 
						n.getResult(), 
						n.getId(), 
						n.getParent().getResult(),
						n.parent.getId());
						
			}	
		}
		
		content += "}\n";
		
		System.out.println(content);
		out.close();
		System.setOut(original);
		
		return file;

	}

	public static void printTreeBasic(String tarProj, String post, ArrayList<Node> tree) throws Exception {
		String p = post.replace("/", "");
		String folder = String.format("%s/Trees/", tarProj);
		FileUtils.forceMkdir(new File(folder));
		
		PrintStream original = new PrintStream(System.out);
		String file = String.format("%s/Trees/%s", tarProj, p);
		
		String fileName = String.format("%s.gv", file);
		PrintStream out = new PrintStream(new FileOutputStream(fileName));
		System.setOut(out);
		
		String content = "digraph G {\n";
		
		for(Node n : tree){
			if(n.parent!=null){
				String nName = n.getName();
				String pName = n.getParent().getName();
				
				if(nName.equals("")){
					nName = "_"+n.getId();
				}
				
				if(pName.equals("")){
					pName = "_"+n.parent.getId();
				}
				
				content += String.format("\t%s -> %s;\n", nName, pName);	
			}	
		}
		
		content += "}\n";
		
		System.out.println(content);
		out.close();
		System.setOut(original);
		

	}

	public static void updateTreeBasic(String tarProj, String post, Map<String, String> map) throws Exception {
		String p = post.replace("/", "");
		String folder = String.format("%s/Trees/", tarProj);
		FileUtils.forceMkdir(new File(folder));
		
		PrintStream original = new PrintStream(System.out);
		String file = String.format("%s/Trees/%s", tarProj, p);
		
		String fileName = String.format("%s.gv", file);
		
		
		// read in content
		BufferedReader input = new BufferedReader (new InputStreamReader (new FileInputStream (fileName)));
		String line;
		String content = "";
        while ((line = input.readLine()) != null) {
           if(line.indexOf("}") != -1){
        	   break;
           }else if(line.indexOf("[shape=circle, style=filled, fillcolor=red]")!=-1){
        	   continue;
           }
           else{
        	   content += line+"\n";
           }
        }
		
        input.close();
		
        
        // update content
		for(String k : map.keySet()){
			if(map.get(k).equals("false")){
				content += String.format("%s[shape=circle, style=filled, fillcolor=red]\n", k);
			}
		}
		content += "}\n";
		PrintStream out = new PrintStream(new FileOutputStream(fileName), false);
		System.setOut(out);
		System.out.println(content);
		out.close();
		System.setOut(original);
		

	}
	
	public static void clean(String filePath, String ext) {
		
		//TODO delete all gv files.
	}
	
	

}
