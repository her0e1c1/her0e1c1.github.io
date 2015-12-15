// reallocはO(n)じゃないの?

// mallocも0で初期化されているみたい
ce 'char*p=malloc(1 << 10); REP(i,10)if(p[i])printf("1");' 
ce 'char*a; __typeof(a) i = "abc";'

// fill 0
ce 'char*p=calloc(10, sizeof(char)); printf("%s", p);'

// 失敗
ce 'char*p=malloc(1 << 31); printf("A%sA",p);'

// realloc use copy 
ce 'char*p=malloc(10);memcpy(p, "abcd", 5); printf("%s", realloc(p, 5));'
ce 'char*p=malloc(10);memcpy(p, "abcd", 5); if (realloc(p, 5) != p)printf("not same");'

// 'printf("%lud",ULONG_MAX);'

//
ce 'printf("%d",ULONG_MAX == (0UL - 1));'

// 8byte == 64bit(111..1) 2^63 + 2^62 + ... + 2^0 == 2^64 - 1
ce 'printf("%lu",sizeof(ULONG_MAX));'

// 2byte
ce 'printf("%lu",sizeof(short int));'
ce 'printf("%lu",sizeof(short));'

//-2 ^ 15 + 1
ce 'printf("%d",SHRT_MIN);'


# 
make -m /usr/home/mbp/GDrive/repos/freebsd.git/share/mk/ 


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



# 指定したパスがディレクトリか判定
ce 'struct stat sb; printf("%s", stat(argv[1], &sb) == 0 && S_ISDIR(sb.st_mode) ? "DIR" : "NOT DIR");' ~/.emacs.d

# PATH_MAX(=1024)を超えるとstatは失敗する
# mkdir a  # 事前にaディレクトリを作成"a/../"は5文字なので205回繰り返すと1024は超える
ce 'struct stat sb; printf("%s", stat(argv[1], &sb) == 0 && S_ISDIR(sb.st_mode) ? "DIR" : "NOT DIR");' `perl -e 'print "a/../" x 205'`
