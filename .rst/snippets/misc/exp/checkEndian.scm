/*
 endianがことなると、バイナリデータ自体が異なることになる。
 ネットワークではbig endianを指定するなど仕様が決まっている

 1234ABCD => CD AB 34 12 (little)
 1234ABCD => 12 34 AB CD (big)

 1byteは0000~1111 or 0x00~0xffなので
 12, 34, AB, CDで１つの塊とみなす(12を1と2で分けたりしない)
 */
#include <stdio.h>
int main() {
  short int word = 0x0001;  // 2byte
  char *byte = (char *) &word;
  
  if (byte[0]) {
    // 以下のように格納されていた場合(addressの増える方向と、桁の方向が一致)
    // 01
    // 00
    printf("Little endian\n");
  }
  else {
    // 以下のように格納されていた(addressの大きい方から連結できる)
    // 00
    // 01
    printf("big endian\n");
  }
}
