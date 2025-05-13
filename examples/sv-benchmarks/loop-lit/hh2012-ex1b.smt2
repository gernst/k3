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
      (< i 100)
      (sequence
        (assign ((j 0)))
        (while
          (< j 100)
          (sequence
            (assign ((j (+ j 1))))
            (assert (<= j 100))))
        (assert (= j 100))
        (assign ((i (+ i 1))))
        (assert (<= i 100))))
    (assert (= i 100))
    (assign ((|c#result| 0)))
    (return)))
