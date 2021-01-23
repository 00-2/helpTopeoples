import java.math.BigInteger;
import java.util.ArrayList;
 


public class Recursion {
	
	public static void countdown (int n) {
	    System.out.println(n);
		if(n>0) {countdown(n-1);}
	}
	public static void countup (int n) {
		if(n>0) {countdown(n-1);}
		System.out.println(n);
	}
	
	public static int pow(int ctd, int base,int n) {
		for(int i = 0; i<n; i++) {
			 ctd*=base;
		}
		return ctd;
	}
	
	public static int hornerRecursive(int[]digits, int base,int n) {
		if (n>=0) {
			return pow(digits[digits.length-n-1],base,n)+hornerRecursive(digits, base,n-1);
		}
		else {
			return 0;
		}
	}
	
	public static long gNaive(int i) {
		if (i == 0) return 0;
		else if (i == 1) return 1;
		else {
			return 2*gNaive(i-1)+5*gNaive(i-2);
		}
	}
	
	private static ArrayList<Long> gCache = new ArrayList<Long>();
    static
    {
        gCache.add((long) 0);
        gCache.add((long) 1);
    }
	
    public static Long gTailHelper(int n)
    {
        if (n >= gCache.size())
        {
            gCache.add(n, (long)(2*gTailHelper(n - 1) + 5*gTailHelper(n - 2)));
        }
        return gCache.get(n);
    }
 
    
	public static long gTail(int i) {
		if (i == 0) return 0;
		else if (i == 1) return 1;
		else {
			long giMinusOne = gTailHelper(i-1);
			long giMinusTwo = gTailHelper(i-2);
			
			return 2*giMinusOne+5*giMinusTwo;
		}
	}
	
	public static long gIter(int i) {
		long giMinusOne = 1;
		long giMinusTwo = 0;
		long sum=1;
		for(int j = 1; j<i; j++) {
			sum=2*giMinusOne+5*giMinusTwo;
			giMinusTwo = giMinusOne;
			giMinusOne = sum;
		}
		return sum;
	}
	
	public static void main(String[] args) {
		/*countdown(3); 1*/
		/*countup(3) 2*/
		/*int[]digits = {1,2,3};//3 + 2*4 + 1*16 length =27
		int result = hornerRecursive(digits,4,digits.length-1);
		System.out.print(result); 3*/
		/*System.out.println(gNaive(10));
		System.out.println(gTail(10));
		System.out.print(gIter(10));
		*/
		
	}
}
