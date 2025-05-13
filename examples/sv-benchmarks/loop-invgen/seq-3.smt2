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
  ((n0 Int) (n1 Int) (i0 Int) (k Int))
  (sequence
    (assign ((i0 0)))
    (assign ((k 0)))
    (havoc (n0))
    (havoc (n1))
    (if
      (not
        (and (<= (- 1000000) n0) (< n0 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (if
      (not
        (and (<= (- 1000000) n1) (< n1 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i0 n0)
      (sequence
        (assign ((i0 (+ i0 1))))
        (assign ((k (+ k 1))))))
    (assign ((i1 0)))
    (while
      (< i1 n1)
      (sequence
        (assign ((i1 (+ i1 1))))
        (assign ((k (+ k 1))))))
    (assign ((j1 0)))
    (while
      (< j1 (+ n0 n1))
      (sequence
        (assert (< 0 k))
        (assign ((j1 (+ j1 1))))
        (assign ((k (- k 1))))))))
