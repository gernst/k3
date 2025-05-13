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
  ((i Int) (k Int) (j Int))
  (sequence
    (assign ((i 0)))
    (assign ((k 0)))
    (while
      (< i 1000000)
      (sequence
        (if
          (not
            (and (<= 1 j) (< j 1000000)))
          (sequence
            (assign ((|c#result| 0)))
            (return)))
        (assign ((i (+ i j))))
        (assign ((k (+ k 1))))))
    (assert (<= k 1000000))
    (assign ((|c#result| 0)))
    (return)))
