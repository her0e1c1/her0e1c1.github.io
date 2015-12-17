list_t *inits(int argc, ...) {
  // with append1, O(n)
  // if you use append, the complexity is O(n^2)
  if (argc <= 0)
    return NULL;

  va_list list;
  va_start(list, argc);
  
  // WARN: you need NULL, or sometimes it's initilized by the other value
  // NULL needs including stdio.h header
  list_t* head = NULL;
  list_t* tail = NULL;
  for (int i = 0; i < argc; i++)
    append1(&head, &tail, va_arg(list, int));

  va_end(list);
  return head;
}
