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
      (not (< x y))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< x y)
      (sequence
        (if
          (< x 0)
          (assign ((x (+ x 7))))
          (assign ((x (+ x 10)))))
        (if
          (< y 0)
          (assign ((y (- y 10))))
          (assign ((y (+ y 3)))))))
    (assert
      (and (<= y x) (<= x (+ y 16))))
    (assign ((|c#result| 0)))
    (return)))
