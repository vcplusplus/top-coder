#include <algorithm>
#include <iostream>
#include <map>
#include <vector>
using namespace std;

map<int, vector<pair<int, int>>> M;

int main() {
  /* variables and strictures*/
  int n, m, k;

  /*input*/
  cin >> n >> m >> k;
  for (int i = 0; i < k; ++i) {
    int r, c1, c2;
    cin >> r >> c1 >> c2;
    if (M.find(r) == M.end()) {
      M[r] = vector<pair<int, int>>();
    }
    M[r].push_back(make_pair(c1, c2));
  }

  /*solution*/

  // the number of cells in the matrix
  // out of which i will subtract the
  // occupied cells
  long long ans = 1LL * n * m;

  for (auto &iter : M) {
    // sort the intervals on each line of the matrix
    sort(iter.second.begin(), iter.second.end());
  }

  for (auto &intervals : M) {
    /// cerr << "#" << intervals.first << endl;
    int start = 1;
    int end = 0;
    for (auto &interval : intervals.second) {
      // if the current interval doesn't
      // intersect the previous contignuous region
      if (interval.first > end) {
        // subtract the length of the previous region
        // from the answer
        ans -= end - start + 1;
        /// cerr << end << ' ' << start << ' ' << end - start + 1 << endl;
        // the new contignuous region is the current interval
        start = interval.first;
        end = interval.second;
      } else {
        // if the interval is intersecting the contignuous region
        // extend the region if needed
        end = max(interval.second, end);
      }
    }
    // subtract the legth of the last cont. interval
    /// cerr << end << ' ' << start << ' ' << end - start + 1 << endl;
    ans -= end - start + 1;
  }

  /*output*/
  cout << ans;

  return 0;
}