list_t *reverseX(list_t *node) {
  list_t *head = NULL;
  while (node) {
    list_t *next = node->next;
    node->next = head;
    head = node;
    node = next;
  }
  return head;
}
