#include <iostream>
#include <vector>
using namespace std;

// MEMO: :Q:nC3
void nC3(vector<int> N){
  int size = N.size();
  for (int i = 0; i < size-2; i++){
    for (int j = i+1; j < size-1; j++){
      for (int k = j+1; k < size; k++){
        cout << N[i] << ", " << N[j] << ", " << N[k] << endl;
      }
    }
  }
}
int main() { nC3({1,2,3,4,5}); }
