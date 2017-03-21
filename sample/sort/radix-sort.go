package main

import "fmt"

func RadixSort(A []int, limit int) {
	for l := 1; l <= limit; l *= 10 {
		x := make([]int, len(A))
		k := 0
		for d := 0; d <= 9; d++ {
			for i := 0; i < len(A); i++ {
				if (A[i]/l)%10 == d {
					x[k] = A[i]
					k++
				}
			}
		}
		copy(A, x)
	}
}

func main() {
	A := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 6, 5, 4, 3, 6, 5, 4, 3, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0}
	RadixSort(A, 100)
	fmt.Println(A)
}
