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
  ((m Int)
    (n Int)
    (nondet_bool$1 Int)
    (nondet_bool$2 Int)
    (nondet_bool$4 Int)
    (nondet_bool$5 Int))
  (sequence
    (assign ((m 0)))
    (assign ((n 0)))
    (while
      (not (= 1 0))
      (sequence
        (assert (<= m 60))
        (assert (<= n 60))
        (if
          (not (= nondet_bool$1 0))
          (if
            (not (= nondet_bool$2 0))
            (if
              (< m 60)
              (assign ((m (+ m 1))))
              (sequence (assert (= m 60)) (assign ((m 0)))))))
        (if
          (not (= nondet_bool$4 0))
          (if
            (not (= nondet_bool$5 0))
            (if
              (< n 60)
              (assign ((n (+ n 1))))
              (sequence (assert (= n 60)) (assign ((n 0)))))))))
    (assign ((|c#result| 0)))
    (return)))
