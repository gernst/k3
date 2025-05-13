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
  ((i Int) (k Int) (n Int))
  (sequence
    (if
      (not
        (and (= i 0) (= k 0)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i n)
      (sequence
        (assign ((i (+ i 1))))
        (assign ((k (+ k 1))))))
    (assert (<= n k))
    (assign ((|c#result| 0)))
    (return)))
