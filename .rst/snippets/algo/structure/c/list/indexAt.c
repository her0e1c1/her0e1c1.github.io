list_t *indexAt(list_t* head, int index) {
#define INDEX_ERROR {       \
  printf("Out of index\n"); \
  exit(1); }

  if (index < 0)
    INDEX_ERROR
  for (int i = 0; i < index; i++) {
    if (head)
      head = head->next;
    else
      INDEX_ERROR
  }
  return head;
#undef INDEX_ERROR
}
