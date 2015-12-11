void append(list_t** head, int data) {
  list_t* n = init(data);
  if (*head == NULL) {
    *head = n;
  } else {
    list_t* last = *head;
    while(last->next)
      last = last->next;
    last->next = n;
  }
}
