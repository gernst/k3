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
  ((i Int) (k Int))
  (sequence
    (havoc (k))
    (if
      (not
        (and (<= 0 k) (<= k 10)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (while
      (< i (* 1000000 k))
      (assign ((i (+ i k)))))
    (assert (= i (* 1000000 k)))
    (assign ((|c#result| 0)))
    (return)))
