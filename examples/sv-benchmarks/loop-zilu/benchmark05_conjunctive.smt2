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
  ((x Int) (y Int) (n Int))
  (sequence
    (if
      (not
        (and (<= 0 x) (<= x y) (< y n)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< x n)
      (sequence
        (assign ((x (+ x 1))))
        (if
          (< y x)
          (assign ((y (+ y 1)))))))
    (assert (= y n))
    (assign ((|c#result| 0)))
    (return)))
