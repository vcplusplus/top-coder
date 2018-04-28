#include <bits/stdc++.h>
using namespace std;

map<pair <long, long>, bool> M;
long N,K,R,C,ans, x, y;
int main() {
    cin>>N>>K;
    cin>>R>>C;
    for(int i=0; i<K; i++){
        cin>>x>>y;
        M[make_pair(x,y)]=1;
    }
    ans=0;
    for(int r=R+1; r<=N; r++){
        if(M[make_pair(r,C)])break;
        ans++;
    }
    for(int r=R-1; r>=1; r--){
        if(M[make_pair(r,C)])break;
        ans++;
    }
    for(int c=C+1; c<=N; c++){
        if(M[make_pair(R,c)])break;
        ans++;
    }
    for(int c=C-1; c>=1; c--){
        if(M[make_pair(R,c)])break;
        ans++;
    }

    //diags
    for(int c=C+1, r=R+1; c<=N && r<=N; c++, r++){
        if(M[make_pair(r,c)])break;
        ans++;
    }
    for(int c=C-1, r=R+1; c>=1 && r<=N; c--, r++){
        if(M[make_pair(r,c)])break;
        ans++;
    }
    for(int c=C+1, r=R-1; c<=N && r>=1; c++, r--){
        if(M[make_pair(r,c)])break;
        ans++;
    }
    for(int c=C-1, r=R-1; c>=1 && r>=1; c--, r--){
        if(M[make_pair(r,c)])break;
        ans++;
    }

    cout<<ans;
    return 0;
}