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
    (assign ((x 0)))
    (assign ((y 500000)))
    (assign ((x 0)))
    (while
      (< x 1000000)
      (if
        (< x 500000)
        (assign ((x (+ x 1))))
        (sequence
          (if
            (< x 750000)
            (assign ((x (+ x 1))))
            (assign ((x (+ x 2)))))
          (assign ((y (+ y 1)))))))
    (assert (= x 1000000))
    (assign ((|c#result| 0)))
    (return)))
