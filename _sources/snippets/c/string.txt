
==================
 Implement Vector
==================

I wrote a simple vector in C.

Here are features of a vector.
If you want to get more in detail, go to each of the page links.

.. contents::


s_reverse
=========


.. code-block:: c

    char *s_reverse(char *str) {
      if (*str == '\0')
        return str;
    
      char *first = str;
      char *last = str;
      while (*last)
        last++;
      last--;
      while (first < last) {
        char tmp = *first;
        *first = *last;
        *last = tmp;
        first++;
        last--;
      }
      return str;
    }




s_reverse_word
==============


.. code-block:: c

    char *s_reverse_word(char *str) {
    
    }




s_strip
=======


.. code-block:: c

    char *s_strip(char *str) {
      while (*str == ' ')
        str++;
      char *last = str;
      while (*last)
        last++;
      last--;  // go backword from '\0'
      while (*last == ' ')
        last--;
      *++last = '\0';
      return str;
    }




s_strcmp
========


.. code-block:: c

    int s_strcmp(char *p, char *q) {
      while (*p && *q) {
        if (*p < *q)
          return -1;
        else if (*p > *q)
          return 1;
        p++;
        q++;
      }
      if (*p)
        return 1;  // q is longer
      else if (*q)
        return -1;  // p is longer
      else
        return 0; // same length
    }




s_strlen
========


.. code-block:: c

    int s_strlen(char *str) {
      char *last = str;
      while (*last) last++;
      return last - str;
    }




s_join
======


.. code-block:: c

    char *s_join(char **str, char delim, int length) {
      int sum = 0;
      for (int i = 0; i < length; i++)
        sum += s_strlen(str[i]);
      sum += length;  // delim * (length - 1) + '\0'
    
      char *p, *q;
      p = q = (char *)malloc(sizeof(char) * sum);
      for (int i = 0; i < length; i++) {
        for (char *s = str[i]; *s; s++)
          *q++ = *s;
        *q++ = delim;
      }
      *--q = '\0';
      return p;
    }




s_lower
=======


.. code-block:: c

    char *s_lower(char *str) {
      for (char *c = str; *c; c++) {
        if ('A' <= *c && *c <= 'Z') {
          *c = 'a' + (*c - 'A');
        }
      }
      return str;
    }




s_upper
=======


.. code-block:: c

    char *s_upper(char *str) {
      for (char *c = str; *c; c++) {
        if ('a' <= *c && *c <= 'z') {
          *c = 'A' + (*c - 'a');
        }
      }
      return str;
    }




s_is_substring
==============


.. code-block:: c

    int s_is_substring(char *ps, char *qs) {
      char *p, *q;
      for (char *s = ps; *s; s++) {
        char *p = s;
        char *q = qs;
        while (*p && *q)
          if (*p == *q) {
            p++;
            q++;
          } else
            break;
        if (*q == '\0')
          return 1;
      }
      return -1;
    }

All source code
===============

.. literalinclude:: /src/c/string.c
   :language: c
   :linenos:

