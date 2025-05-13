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
      (< 0 y)
      (while
        (< x 100)
        (assign ((x (+ x y))))))
    (assert
      (or
        (<= y 0)
        (and (< y 0) (<= 100 x))))
    (assign ((|c#result| 0)))
    (return)))
