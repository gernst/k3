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
  ((i Int) (j Int) (k Int))
  (sequence
    (if
      (not
        (and (< i j) (< 0 k)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i j)
      (sequence
        (assign ((k (+ k 1))))
        (assign ((i (+ i 1))))))
    (assert (< (- j i) k))
    (assign ((|c#result| 0)))
    (return)))
