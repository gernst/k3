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
  ((n Int) (k Int) (i Int))
  (sequence
    (assign ((k 0)))
    (assign ((i 0)))
    (havoc (n))
    (while
      (< i n)
      (sequence
        (assign ((i (+ i 1))))
        (assign ((k (+ k 1))))))
    (assign ((j n)))
    (while
      (< 0 j)
      (sequence
        (assert (< 0 k))
        (assign ((j (- j 1))))
        (assign ((k (- k 1))))))
    (assign ((|c#result| 0)))
    (return)))
