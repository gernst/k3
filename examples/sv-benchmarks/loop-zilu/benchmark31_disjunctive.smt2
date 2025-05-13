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
      (not (< x 0))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (not (= 1 0))
      (if
        (<= 0 x)
        (break)
        (sequence
          (assign ((x (+ x y))))
          (assign ((y (+ y 1)))))))
    (assert (<= 0 y))
    (assign ((|c#result| 0)))
    (return)))
