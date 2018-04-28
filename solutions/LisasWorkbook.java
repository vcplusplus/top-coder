import java.util.*;

public class Solution {

  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    int special = 0;
    int page = 1;
    int n = in.nextInt();
    int k = in.nextInt();
    for (int i = 0; i < n; i++) {
      int t = in.nextInt();
      for (int j = 1; j <= t; j++) {
        if (j == page)
          special++;
        if (j % k == 0 || j == t)
          page++;
      }
    }
    System.out.println(special);
  }

}