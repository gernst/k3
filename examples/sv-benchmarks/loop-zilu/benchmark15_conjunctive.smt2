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
  ((low Int) (mid Int) (high Int))
  (sequence
    (if
      (not
        (and (= low 0) (<= 1 mid) (= high (* 2 mid))))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< 0 mid)
      (sequence
        (assign ((low (+ low 1))))
        (assign ((high (- high 1))))
        (assign ((mid (- mid 1))))))
    (assert (= low high))
    (assign ((|c#result| 0)))
    (return)))
