(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((n Int) (i Int) (k Int))
  (sequence
    (havoc (n))
    (if
      (not (<= n 1000000))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((k n)))
    (assign ((i 0)))
    (while
      (< i n)
      (sequence
        (assign ((k (- k 1))))
        (assign ((i (+ i 2))))))
    (assign ((j 0)))
    (while
      (< j (div n 2))
      (sequence
        (assert (< 0 k))
        (assign ((k (- k 1))))
        (assign ((j (+ j 1))))))
    (assign ((|c#result| 0)))
    (return)))
