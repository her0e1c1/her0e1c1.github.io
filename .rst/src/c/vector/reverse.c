list_t *reverse(list_t* node) {
  list_t *head = NULL;
  while (node) {
    list_t *n = init(node->data);
    n->next = head;
    head = n;
    node = node->next;
  }
  return head;
}
