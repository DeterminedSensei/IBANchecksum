import java.util.Scanner;
import java.lang.Math;

public class Main {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        String iban = sc.nextLine().trim();
        if(checksumvalidate(iban.charAt(0), iban.charAt(1), Integer.parseInt(iban.substring(2,4)), iban.substring(4)))
            System.out.println("Valid IBAN");
        else
            System.out.println("Invalid IBAN");
    }

    private static boolean checksumvalidate(char c, char c2, int checksum,String numbers){

        int residue = 0;
        int i;
        for (i = 0; i < (numbers.length() / 6); i++)
        {
            residue = (Integer.parseInt(numbers.substring(i*6,i*6+6)) + residue*1000000) % 97;
        }
        if (numbers.length() != i * 6)
        {
            residue = (Integer.parseInt(numbers.substring(i*6)) + residue * (int)Math.pow(10, numbers.length() % 6)) % 97;
        }

        int sumcheck = (c - 55) * 100 + (c2 - 55);
        residue = (sumcheck * 100 + residue * 1000000) % 97;
        sumcheck = 98 - residue;

        return sumcheck == checksum;
    }
}