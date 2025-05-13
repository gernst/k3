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
  ((i Int) (k Int) (n Int) (l Int))
  (sequence
    (havoc (n))
    (havoc (l))
    (if
      (not (< 0 l))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (if
      (not (< l 1000000))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (if
      (not (< n 1000000))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((k 1)))
    (while
      (< k n)
      (sequence
        (assign ((i l)))
        (while
          (< i n)
          (sequence
            (assert (<= 1 i))
            (assign ((i (+ i 1))))))
        (if
          (not (= nondet_int$2 0))
          (assign ((l (+ l 1)))))
        (assign ((k (+ k 1))))))))
