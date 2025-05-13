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
  ((i Int) (j Int) (k Int))
  (sequence
    (assign ((i 0)))
    (assign ((k 9)))
    (assign ((j (- 100))))
    (while
      (<= i 100)
      (sequence
        (assign ((i (+ i 1))))
        (while
          (< j 20)
          (assign ((j (+ i j)))))
        (assign ((k 4)))
        (while
          (<= k 3)
          (assign ((k (+ k 1)))))))
    (assert (= k 4))
    (assign ((|c#result| 0)))
    (return)))
