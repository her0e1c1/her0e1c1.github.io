package main

import "fmt"
import "sort"
import "strings"

func SortString(w string) string {
	s := strings.Split(w, "")
	sort.Strings(s)
	return strings.Join(s, "")
}

type Anagram []string

func (a Anagram) Len () int {
	return len(a)
}

func (a Anagram) Swap (i, j int) {
	a[i], a[j] = a[j], a[i]
}

func (a Anagram) Less (i, j int) bool {
	return strings.Compare(SortString(a[i]), SortString(a[j])) == -1
}

func main () {
	a := []string {"cb", "abc", "a", "bb", "bac", "ca", "d", "cba", "bc", "acb"}
	sort.Sort(Anagram(a))
	fmt.Println(a)
}
