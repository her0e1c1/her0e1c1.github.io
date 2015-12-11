void insertNext(list_t *node, int data) {
  list_t* n = init(data);
  n->next = node->next;
  node->next = n;
}
