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
  ((j Int) (i Int) (x Int) (y Int) (k Int) (nondet_bool$1 Int))
  (sequence
    (assign ((j 0)))
    (if
      (not (= (+ x y) k))
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
          (= j i)
          (sequence
            (assign ((x (+ x 1))))
            (assign ((y (- y 1)))))
          (sequence
            (assign ((y (+ y 1))))
            (assign ((x (- x 1))))))
        (assign ((j (+ j 1))))))
    (assert (= (+ x y) k))
    (assign ((|c#result| 0)))
    (return)))
