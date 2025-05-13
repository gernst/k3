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
  ((v Int))
  (sequence
    (assign ((v 1)))
    (while
      (<= v 50)
      (sequence
        (assert (<= 1 v))
        (assign ((v (+ v 2))))
        (assert (<= v 52))))
    (assert (<= 51 v))
    (assert (<= v 52))
    (assign ((|c#result| 0)))
    (return)))
