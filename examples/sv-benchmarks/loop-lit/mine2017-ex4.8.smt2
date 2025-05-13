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
  ((v Int) (nondet_bool$1 Int))
  (sequence
    (assign ((v 0)))
    (while
      true
      (sequence
        (if
          (not (= nondet_bool$1 0))
          (break))
        (assert (<= 0 v))
        (assert (<= v 1))
        (if (= v 0) (assign ((v 1))))))
    (assign ((|c#result| 0)))
    (return)))
