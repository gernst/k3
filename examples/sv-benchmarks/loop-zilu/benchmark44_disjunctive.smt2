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
          (and (< x 0) (< y 0))
          (sequence
            (assign ((x (+ x 7))))
            (assign ((y (- y 10))))))
        (if
          (and (< x 0) (<= 0 y))
          (sequence
            (assign ((x (+ x 7))))
            (assign ((y (+ y 3)))))
          (sequence
            (assign ((x (+ x 10))))
            (assign ((y (+ y 3))))))))
    (assert
      (and (<= y x) (<= x (+ y 16))))
    (assign ((|c#result| 0)))
    (return)))
