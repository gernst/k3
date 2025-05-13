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
  ((x Int) (y Int) (z Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not
        (and (= x y) (= y 0) (= z 0)))
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
        (assign ((x (+ x 1))))
        (assign ((y (+ y 1))))
        (assign ((z (- z 2))))))
    (assert
      (and (= x y) (<= 0 x) (= (+ (+ x y) z) 0)))
    (assign ((|c#result| 0)))
    (return)))
