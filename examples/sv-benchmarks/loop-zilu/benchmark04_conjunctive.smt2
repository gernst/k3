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
  ((k Int) (j Int) (n Int))
  (sequence
    (if
      (not
        (and (<= 1 n) (<= n k) (= j 0)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (<= j (- n 1))
      (sequence
        (assign ((j (+ j 1))))
        (assign ((k (- k 1))))))
    (assert (<= 0 k))
    (assign ((|c#result| 0)))
    (return)))
