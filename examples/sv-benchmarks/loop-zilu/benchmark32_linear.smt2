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
  ((x Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not (or (= x 1) (= x 2)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_bool$1 0)))
          (break))
        (if
          (= x 1)
          (assign ((x 2)))
          (if (= x 2) (assign ((x 1)))))))
    (assert (<= x 8))
    (assign ((|c#result| 0)))
    (return)))
