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
    (if
      (not
        (and (= i 0) (= j 0)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i 100)
      (sequence
        (assign ((j (+ j 2))))
        (assign ((i (+ i 1))))))
    (assert (= j 200))
    (assign ((|c#result| 0)))
    (return)))
