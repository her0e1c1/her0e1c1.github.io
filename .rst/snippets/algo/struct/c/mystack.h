
// stack
// pop O(1)
// push O(1)
// min/max O(1)

#include <stdio.h>
#include <stack.h>

node_t* init(int value){
  node_t* newNode = (node_t*) malloc(sizeof(node_t));
  if (newNode == NULL)
    return NULL;
  newNode->value = value;
  newNode->next = NULL;
  return newNode;
}

// stackはリストの先頭に要素を加えていくことでO(1)を実現
void push(node_t** head, int value){
  node_t* new = init(value);
  if (*head == NULL) {
    *head = new;
    return;
  }
  node_t* first = *head;
  new->next = first;
  *head = new;
}


void pop(node_t** head){
  node_t* first = *head;
  if (first == NULL)  // empty
    return;
  int value = first->value;
  *head = first->next;
  free(first);
}

void display(node_t* head){
  if (head == NULL)
    return;
  node_t* n;
  for(n = head; n->next; n = n->next)
    printf("%d,", n->value);
  printf("%d\n", n->value);
}
