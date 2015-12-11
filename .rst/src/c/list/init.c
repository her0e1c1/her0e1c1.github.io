list_t *init(int data) {
  list_t* newNode = (list_t*) malloc(sizeof(list_t));
  if (newNode == NULL) {
    exit(1);
  }
  newNode->data = data;
  newNode->next = NULL;
  return newNode;
}
