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
    (havoc (n))
    (if
      (not
        (and (<= 1 n) (<= n 1000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((sum 0)))
    (assign ((i 1)))
    (while
      (<= i n)
      (sequence
        (assign ((sum (+ sum i))))
        (assign ((i (+ i 1))))))
    (assert
      (= (* 2 sum) (* n (+ n 1))))
    (assign ((|c#result| 0)))
    (return)))
