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
  ((i Int) (j Int))
  (sequence
    (assign ((i 0)))
    (while
      (not (= 1 0))
      (sequence
        (assign ((i (+ i 1))))
        (assign ((j 0)))
        (while
          (< j 10)
          (sequence
            (assert (<= 0 i))
            (assert (<= i 10))
            (assign ((j (+ j 1))))))
        (if (< 9 i) (assign ((i 0))))))
    (assign ((|c#result| 0)))
    (return)))
