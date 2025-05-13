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
  ((n Int) (sum Int) (i Int))
  (sequence
    (if
      (not
        (and (<= 0 n) (= sum 0) (= i 0)))
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
