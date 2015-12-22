// http://www.geeksforgeeks.org/reverse-alternate-k-nodes-in-a-singly-linked-list/
#include <stdio.h>
#include <stdlib.h>

struct node {
  int value;
  struct node* next;
};
// typedef struct node node_t

struct node* new(int value) {
  struct node* n = malloc(sizeof(struct node));
  n->value = value;
  n->next = NULL;
  return n;
}

void print(struct node* head) {
  struct node* n = head;
  while (n) {
    printf("%d, ", n->value);
    n = n->next;
  }
  printf("\n");
}

struct node* reverse(struct node* head, int k) {
  int flag, count;
  struct node* n, *first, *last, *bf, *bl;

  flag = count = 0;
  n = head;
  bf = bl = first = last = NULL;

  while (n) {
    // 上書きされる前に次をあらかじめ保持しておく
    struct node* next = n->next;

    if (count == k) {
      if (first == NULL && last == NULL) {
        first = bf;
        last = bl;
      } else {
        last->next = bf;
        last = bl;
      }
      count = 0;
      bf = bl = NULL;
      flag = flag ? 0 : 1;
      continue;

    } else if (bf == NULL && bl == NULL) {
      n->next = NULL;
      bf = bl = n;
    } else if (flag == 0) {
      n->next = bf;
      bf = n;
    } else {
      bl->next = n;
      bl = n;
    }

    count++;
    n = next;
  }

  if (bf)
    last->next = bf;

  return first;
}

void push(struct node** head, int value) {
  struct node* n = new(value);
  if (*head == NULL) {
    *head = n;
  } else {
    struct node* end = *head;
    while (end->next)
      end = end->next;
    end->next = n;
  }
}

int main() {
  struct node* head = NULL;
  for (int i = 1; i < 21; i++)
    push(&head, i);
  head = reverse(head, 3);
  print(head);
}
