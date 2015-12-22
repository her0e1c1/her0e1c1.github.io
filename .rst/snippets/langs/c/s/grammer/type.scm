
#include <stdio.h>

#define P(x, s) printf("%s = " s "\n", #x, (x));

// long longは整数
// doubleは実数

int main(){
  int a = 1;
  P(a, "%d");

  unsigned int a1 = 1;
  P(a1, "%u");

  // unsigned char c: 3; // Error
  // char
  P(0x41, "%c");
  P('A', "%c");
  P(65, "%c");

  P((char)0, "%d");
  P((char)-1, "%d");
  P((char)127, "%d");
  P((char)128, "%d");
  P((char)129, "%d");  // -127
  P((char)-127, "%d");
  P((char)-128, "%d");
  P((char)-129, "%d");  // 127

  P((unsigned char)255 , "%d");
  P((unsigned char)256 , "%d");  // 0
  P((unsigned char)-1 , "%d");  // 255

  P((unsigned char)(2 << 6), "%d");  // 128
  P((unsigned char)((2 << 7) - 1), "%d");
  P((unsigned char)(2 << 7), "%d");
  P((unsigned char)((2 << 8) - 1), "%d");
  P((unsigned char)(2 << 8), "%d");
  P((unsigned char)(2 << 9), "%d");  // 100000000 => 0と同じ
  P((unsigned char)((2 << 9) - 1), "%d");


  // No format of unsigned char exists
  //P((unsigned char)200, "%c");  // \310
  //P((unsigned char)200, "%cu"); // \310u
  //P((unsigned char)200, "%uc"); // 200c

  // sign integer
  P(2 << 29, "%d");
  P((2 << 30) - 1, "%d");
  P(2 << 30, "%d");  // Overflow
  // P(2 << 31, "%d");  // Warning 34bit intger
  P((long)2 << 30, "%ld");

  // unsign integer
  P(2U << 30, "%u");
  P((unsigned)2 << 30, "%u");
  P((unsigned)2 << 31, "%u");
  P(2UL << 31, "%lu");
  //P(2 << 31UL, "%lu");
  P((unsigned long)2 << 31, "%lu");

  P(-1L, "%ld");
  P(-1U, "%u");

  char* p = "aa" "bb";
  P(p, "%s");

  #define INF (double)(1 << 30)
  P(INF, "%f");
}

#include <iostream>

using namespace std;

#define P(x) cout << #x << " = " << (x) << endl;

int main()
{
  P((double)(1 << 30));
  P((double)(1 << 31));
  // P((double)(1 << 32));  // warn
  P((double)(1L << 32));
  P((double)(1UL << 32));
  // P((double)(1U << 32));  // warn

  P((double)(1L << 62));
  P((double)(1L << 63));  // -9.22337e+18
  P((double)(1UL << 63));
  // P((double)(1UL << 64));  // warn

  return 0;
}

#include <stdio.h>
int main(){
  printf("%s\n", c1);  // Show string
  printf("%c\n", c1[0]);  // Show a charector
  printf("%c\n", *c1);  // Show a charector
  printf("%c\n", *(c1 + 0));  // Show a charector
  printf("%c\n", 'M');  // Show a charector

  const char *s = "CONSTANT STRING";
  printf("%c, ", *s);  // 'C'
  s++;  // To increment pointer is no problem
  printf("%c, ", *s);  // 'O'
  printf("%c, ", *(++s));  // 'N'
  printf("%c, ", *++s);  // 'S'
  printf("%c, ", *s++);  // Same result above
  printf("%c, ", *s);  // 'T'
  // printf("%c, ", ++*s);  // This means assignment
}
