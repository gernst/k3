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
  ((x Int))
  (sequence
    (assign ((x 40)))
    (while
      (not (= x 0))
      (sequence
        (assert (<= x 40))
        (assign ((x (- x 1))))
        (assert (<= 0 x))))
    (assert (= x 0))
    (assign ((|c#result| 0)))
    (return)))
