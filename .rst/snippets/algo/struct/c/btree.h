#ifndef MYBTREE
#define MYBTREE

#include <stdio.h>
#include <stdlib.h>

typedef struct _tree {
  int data;
  struct _tree* parent;
  struct _tree* left;
  struct _tree* right;
} btree;

btree *btree_init(int data) {
  btree *t = malloc(sizeof(btree));
  t->parent = t->left = t->right = NULL;
  t->data = data;
  return t;
}

btree *btree_append(btree *parent, btree *left, btree *right) {
  if (left) {
    parent->left = left;
    left->parent = parent;
  }
  if (right) {
    parent->right = right;
    right->parent = parent;
  }
  return parent;
}

int btree_print(btree* node, int depth) {
  if (node) {
    for(int i = 0; i < depth; i++) printf(" ");
    printf("%d\n", node->data);
    btree_print(node->left, depth + 1);
    btree_print(node->right, depth + 1);
  }
  return depth;
}

#endif
