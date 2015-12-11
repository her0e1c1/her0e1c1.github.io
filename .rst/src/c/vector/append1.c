void append1(list_t** start, list_t** end, int data) {
  list_t* n = init(data);
  if (*start == NULL) {
    *start = n;
    *end = n;
  } else {
    (*end)->next = n;
    *end = n;
  }
}
