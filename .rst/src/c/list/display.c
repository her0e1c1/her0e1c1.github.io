void display(list_t* head) {
  printf("<list> ");
  if (head == NULL)
    return;
  list_t* n;
  for(n = head; n->next; n = n->next)
    printf("%d,", n->data);
  printf("%d\n", n->data);
}
