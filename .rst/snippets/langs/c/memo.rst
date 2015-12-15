# make -m /usr/home/mbp/GDrive/repos/freebsd.git/share/mk/ 


rgv[0][0]=='-'
ログインシェルと後に起動したシェルの見分け方はps -f。最初にハイフン「-」がついているシェルがログインシェルのプロセス。


void sizeof_array(int a[]){
  // Warning: a[] of function parameter is a pointer which equals int* a
  //printf("%ld", sizeof(a));
}

// WARN: (i + j) / 2はオーバーフローするので、 i + (j - i) / 2 とすること

- 2 * 文字数 + 1みたいな領域確保のときに+1し忘れのエラーとなるサンプル用意

// int *a;と宣言したほうが良い
// int *p, *q; と複数宣言する場合があるので

// WARN: pointerを２つ同時に宣言するときはアスターは２ついる
int main (){
  int a = 1;
  int *p, *q;
  // int* p, q;  // qはint型
  q = &a;
}

void a(int range){
  // int counter[range] = {0}; この宣言はできない
  int counter[range]; // 一度宣言してから全て初期化する必要あり
}
