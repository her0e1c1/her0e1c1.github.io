package main

import "fmt"

func Sort(a []int) {
	for end := len(a) - 1; end >= 1; end-- {
		for i := 0; i < end; i++ {
			if a[i] > a[i+1] {
				a[i], a[i+1] = a[i+1], a[i]
			}
		}
	}
}

func main() {
	a := []int{1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8, 1, 10, -1, 3, 20, 5, 9, 33, -1, 4, 5, 3, 6}
	Sort(a)
	fmt.Println(a)
}
