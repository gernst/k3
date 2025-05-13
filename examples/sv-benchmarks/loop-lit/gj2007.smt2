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
    (assign ((y 50)))
    (while
      (< x 100)
      (if
        (< x 50)
        (assign ((x (+ x 1))))
        (sequence
          (assign ((x (+ x 1))))
          (assign ((y (+ y 1)))))))
    (assert (= y 100))
    (assign ((|c#result| 0)))
    (return)))
