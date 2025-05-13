(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(define-proc
  main
  ((argc Int)
    (argv
      (|c#ptr| (|c#ptr| Int))))
  ((|c#result| Int))
  ((c1 Int) (c2 Int) (c3 Int) (n Int) (v Int) (i Int) (k Int) (j Int))
  (sequence
    (assign ((c1 4000)))
    (assign ((c2 2000)))
    (assign ((c3 10000)))
    (havoc (n))
    (if
      (not
        (and (<= 0 n) (< n 10)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((k 0)))
    (assign ((i 0)))
    (while
      (< i n)
      (sequence
        (assign ((i (+ i 1))))
        (havoc (v))
        (if
          (not
            (and (<= 0 v) (< n 2)))
          (sequence
            (assign ((|c#result| 0)))
            (return)))
        (if
          (= v 0)
          (assign ((k (+ k c1))))
          (if
            (= v 1)
            (assign ((k (+ k c2))))
            (assign ((k (+ k c3))))))))
    (assign ((j 0)))
    (while
      (< j n)
      (sequence
        (assert (< 0 k))
        (assign ((j (+ j 1))))
        (assign ((k (- k 1))))))
    (assign ((|c#result| 0)))
    (return)))
