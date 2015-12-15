HERE=$(dirname $0)
cat <<EOS
=====
 PHP
=====

::

  curl -O psysh.org/psysh && php psysh

php -r 'echo "hello world";'

<?php

if (1) {
    echo "1 is true\n";
}

$dict = array(5 => 1, 12 => 2);
echo "$dict[5]\n";

$arr = array(10, 20, 30, 40, 50);
echo "$arr[0]\n";


class A {
    public $var = 'a default value';
}
$a = new A();
echo "$a->var\n";

EOS
