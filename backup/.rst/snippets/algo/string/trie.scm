
(p "ある文字列の集合について、1文字ずつ分岐させた木構造")

(cpp #!Q
class Trie {
 Trie *children[26];
 Trie() {
   memset(children, 0, 26 * sizeof(Trie *));
 }
 void insert(char *s) {
  char key = *s - 'a';
  if (*s == '\0')
   return;
  else if (childlen[key] == NULL)
   childlen[key] = new Trie();
  childlen[key]->insert(s + 1);
 }
 bool find(char *s) {
  char key = *s - 'a';
  if (*s == '\0')
   return true;
  else if (childlen[key] == NULL)
   return false;
  return childlen[key]->find(s + 1);
 }

};

Q :str #t)
