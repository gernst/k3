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
  ((x Int) (y Int))
  (sequence
    (if
      (not
        (and (= x y) (<= 0 y)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (not (= x 0))
      (sequence
        (assign ((x (- x 1))))
        (assign ((y (- y 1))))
        (if (or (< x 0) (< y 0)) (break))))
    (assert (= y 0))
    (assign ((|c#result| 0)))
    (return)))
