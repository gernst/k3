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
  ((x Int) (y Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not (<= 0 (* x y)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_bool$1 0)))
          (break))
        (if
          (= x 0)
          (if
            (< 0 y)
            (assign ((x (+ x 1))))
            (assign ((x (- x 1))))))
        (if
          (< 0 x)
          (assign ((y (+ y 1))))
          (assign ((x (- x 1)))))))
    (assert (<= 0 (* x y)))
    (assign ((|c#result| 0)))
    (return)))
