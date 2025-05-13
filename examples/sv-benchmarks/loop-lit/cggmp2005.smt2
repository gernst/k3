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
    (assign ((i 1)))
    (assign ((j 10)))
    (while
      (<= i j)
      (sequence
        (assign ((i (+ i 2))))
        (assign ((j (+ (- 1) j))))))
    (assert (= j 6))
    (assign ((|c#result| 0)))
    (return)))
