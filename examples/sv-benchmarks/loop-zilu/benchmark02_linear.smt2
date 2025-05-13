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
  ((n Int) (i Int) (l Int))
  (sequence
    (assign ((i l)))
    (if
      (not (< 0 l))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i n)
      (assign ((i (+ i 1)))))
    (assert (<= 1 l))
    (assign ((|c#result| 0)))
    (return)))
