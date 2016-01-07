
========
 Monado
========

モナドはコンテキスト。そのまま普通の関数に値を入れることはできない。
また、原則取り出すこともできない。（一時的には取り出せる）

Monado::

   :type (>>=)
   (>>=) :: Monad m => m a -> (a -> m b) -> m b
   (=<<) :: Monad m => (a -> m b) -> m a -> m b
   (>>)  :: Monad m => m a -> m b -> m b
   return:: Monad m => a -> m a

functor::

  fmap:: Functor f => (a -> b) -> f a -> f b

applicative::

    -- improt Control.Applicative
    (<*>):: (Monad m) => m (a -> b) -> m a -> m b

関係式::

   return a >>= k = k a
   m >>= return = m
   xs >>= return . f = fmap f xs
   m >>= (\x -> k x >>= h) = (m >>= k) >>= h

instance
---------
`:i []` で調べられる
   

IO
---
main関数はIO()であるが、これはIOモナドで、戻り値はなし(Nothingでもない！)

return
------
モナドにするだけ。コンテキストは他の型から決めれば良い

``::`` を使用することでどのモナドのコンテキストか決めることができる::

    return 1::[] Int
    return 1:: Maybe Int
    return 1:: IO Int

(>>)
-----
(>>)は、コンテキストはあるが、前の値は使用しない

(>>=)
------
コンテキストはあり、かつ前の値を使用
モナドは、単純にモナドのコンテキストをもつ関数をつなげるだけ(そのコンテキストに対応していない関数は使用できない)

::

   (INPUT >>= A >>= B >>= C ... >>= Z) == OUTPUT

(=<<)
------
ンテキストはあり、かつ前の値を使用(逆順に評価する関数.なお<<は存在しない)
