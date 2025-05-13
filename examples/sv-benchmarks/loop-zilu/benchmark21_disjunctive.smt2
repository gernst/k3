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
      (not (or (< 0 y) (< 0 x)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (not (= 1 0))
      (sequence
        (if (< (- 2) (+ x y)) (break))
        (if
          (< 0 x)
          (assign ((x (+ x 1))))
          (assign ((y (+ y 1)))))))
    (assert (or (< 0 x) (< 0 y)))
    (assign ((|c#result| 0)))
    (return)))
