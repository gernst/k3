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
  ((i Int) (n Int) (sum Int))
  (sequence
    (if
      (not
        (and (= i 0) (<= 0 n) (<= n 100) (= sum 0)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i n)
      (sequence
        (assign ((sum (+ sum i))))
        (assign ((i (+ i 1))))))
    (assert (<= 0 sum))
    (assign ((|c#result| 0)))
    (return)))
