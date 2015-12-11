list_t *search(list_t *head, int data) {
  while (head) {
    if (head->data == data)
      return head;
    head = head->next;
  }
  return NULL;
}
