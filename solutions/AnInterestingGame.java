import java.util.*;

public class Solution {

  public static int solve(int[] a) {
    int currentMax = 0;
    int count = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i] > currentMax) {
        currentMax = a[i];
        count++;
      }
    }

    return count;
  }

  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    int g = in.nextInt();
    for (int a0 = 0; a0 < g; a0++) {
      int n = in.nextInt();
      int[] a = new int[n];
      for (int i = 0; i < n; i++) {
        a[i] = in.nextInt();
      }

      int turns = solve(a);
      System.out.println(((turns & 1) == 0) ? "ANDY" : "BOB");
    }
    in.close();
  }
}