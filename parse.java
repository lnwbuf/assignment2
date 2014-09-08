//5631249021 Thanachote Chotisorayuth
//5631320921 Lalinda Chirachanakul
import java.util.Scanner;
import java.util.StringTokenizer;
public class Stringtoken {
	public static void main(String[] args){
		Scanner kb = new Scanner(System.in);
		System.out.println("Type in a string");
		String input = kb.nextLine();
		input = input.replace("a", "");
		input = input.replace("A", "");
		StringTokenizer st = new StringTokenizer(input);
		String[] tokens = new String[st.countTokens()];
		for(int i = 0; i < tokens.length; i++){
			tokens[i] = st.nextToken();
			if(tokens[i].indexOf('a') != -1){
				tokens[i].replace("a", "");
			}
			String r;
			r = tokens[i].substring(0,1).toUpperCase();
			tokens[i] = r.concat(tokens[i].substring(1));
		}
		String output = "";
		for(int i = 0; i < tokens.length; i++){
			if(i == 0)
				output = tokens[i];
			else
				output = output + " " + tokens[i];
		}
		System.out.println(output);
		kb.close();
	}
}
