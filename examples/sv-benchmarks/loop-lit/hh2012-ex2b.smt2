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
  ((n Int) (nondet_bool$1 Int))
  (sequence
    (assign ((n 0)))
    (while
      (not (= 1 0))
      (sequence
        (assert (<= n 60))
        (if
          (not (= nondet_bool$1 0))
          (if
            (< n 60)
            (assign ((n (+ n 1))))
            (sequence (assert (= n 60)) (assign ((n 0))))))))
    (assign ((|c#result| 0)))
    (return)))
