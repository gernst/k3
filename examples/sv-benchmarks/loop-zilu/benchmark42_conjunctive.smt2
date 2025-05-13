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
    (if
      (not
        (and (= x y) (<= 0 x) (= (+ (+ x y) z) 0)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< 0 x)
      (sequence
        (assign ((x (- x 1))))
        (assign ((y (- y 1))))
        (assign ((z (+ z 1))))
        (assign ((z (+ z 1))))))
    (assert (<= z 0))
    (assign ((|c#result| 0)))
    (return)))
