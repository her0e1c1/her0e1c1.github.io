// 整数を文字列に変換
package main

import "fmt"

func int2str(x int) string {
    if x == 0 {
        return "0"
    } else if x < 0 {
        return "-" + int2str(-x)
    }
	rs := []rune{}
	for d := x; d > 0; d /= 10 { // >= 0だと無限ループ
		r := d%10 + '0'
		rs = append(rs, rune(r))

	}
	return string(rs)
}

func main() {
	fmt.Println(int2str(0)) // "0"
	fmt.Println(int2str(12345)) // "12345"
	fmt.Println(int2str(-12345)) // "-12345"
}
