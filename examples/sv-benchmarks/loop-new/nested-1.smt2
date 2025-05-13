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
  ((n Int) (m Int) (k Int) (i Int) (j Int))
  (sequence
    (assign ((k 0)))
    (if
      (not
        (and (<= 10 n) (<= n 10000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (if
      (not
        (and (<= 10 m) (<= m 10000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (while
      (< i n)
      (sequence
        (assign ((j 0)))
        (while
          (< j m)
          (sequence
            (assign ((k (+ k 1))))
            (assign ((j (+ j 1))))))
        (assign ((i (+ i 1))))))
    (assert (<= 100 k))
    (assign ((|c#result| 0)))
    (return)))
