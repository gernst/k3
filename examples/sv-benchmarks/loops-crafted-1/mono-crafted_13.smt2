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
  ((x Int) (y Int) (z Int))
  (sequence
    (assign ((x 0)))
    (assign ((y 50000)))
    (assign ((z 0)))
    (assign ((x 0)))
    (while
      (< x 1000000)
      (if
        (< x 50000)
        (assign ((x (+ x 1))))
        (sequence
          (assign ((x (+ x 2))))
          (assign ((y (+ y 2)))))))
    (while
      (< z y)
      (sequence
        (assign ((y (- y 1))))
        (assign ((x (- x 1))))))
    (assert (= (mod x 2) 0))
    (assign ((|c#result| 0)))
    (return)))
