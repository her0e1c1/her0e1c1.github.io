;; template<class T> inline
;; void swap(T &first, T &second)
;; {
;;   if (&first != &second)
;;     {
;;       T tmp = first;
;;       first = second;
;;       second = tmp;
;;     }
;; }

;; template<class T> inline
;; void extend(T &a, T &b) {
;;   a.insert(a.end(), b.begin(), b.end());
;; }


(cpp #!Q
#include <stdio.h>

template<int a,int b> struct gcd_helper_t {
  static const int first = b;
  static const int second = a % b;
};

template<int a,int b> struct gcd_t {
  static const int value = gcd_t<gcd_helper_t<a,b>::first,gcd_helper_t<a,b>::second>::value;
};
template<int a> struct gcd_t<a,0> {
  static const int value = a;
};
template<int a,int b> struct lcm_t {
  static const int value = ( a * b ) / gcd_t<a,b>::value;
};
template<int a,int b> void print_gcd_lcm(){
  printf( ("%d と %d の最大公約数は %d, 最小公倍数は %d\n"), a, b, gcd_t<a,b>::value, lcm_t<a,b>::value );
}

int main(){
  print_gcd_lcm<21,35>();
  print_gcd_lcm<35,21>();
  return 0;
}
Q :str #t)
