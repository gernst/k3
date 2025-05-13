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
  ((x Int) (nondet_bool$1 Int) (nondet_bool$2 Int))
  (sequence
    (assign ((x 0)))
    (while
      true
      (sequence
        (if
          (not (= nondet_bool$1 0))
          (break))
        (assert (<= 0 x))
        (assert (<= x 40))
        (if
          (= nondet_bool$2 0)
          (sequence
            (assign ((x (+ x 1))))
            (if (< 40 x) (assign ((x 0))))))))
    (assign ((|c#result| 0)))
    (return)))
