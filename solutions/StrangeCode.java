import java.io.*;
import java.util.*;

public class Solution {

  public static void main(String[] args) {
    long N = 3;

    Scanner in = new Scanner(System.in);

    long K = in.nextLong();

    while (K >= N) {
      K -= N;
      N *= 2;
    }

    System.out.println(N + 1 - K);
  }
}