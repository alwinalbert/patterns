#include<bits/stdc++.h>
using namespace std;
void pattern13(int n){
    for(int i=1;i<=n;i++){
        for(char ch ='A';ch<='A'+i-1;ch++){
            cout<< ch <<" ";
        }
        cout<<endl;
    }
}
int main(){
    int n;
    cin>>n;
    pattern13(n);
    return 0;
}