void deleteThis(list_t* node) {
  if (node == NULL)
    return;
  else if (node->next == NULL) {
    // the last item;
    // you need previous node to set null the next node
    // free(prev);
    // prev->next = null;  // I can't do here!
    printf("Can't delete the last item");
    exit(1);
  } else {
    list_t *tmp = node->next;
    node->data = tmp->data;
    node->next = tmp->next;
    free(tmp);  // Don't forget!
  }
}
