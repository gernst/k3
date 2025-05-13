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
    (assign ((x 1)))
    (if
      (not (< 0 y))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< x y)
      (if
        (< x (div y x))
        (assign ((x (* x x))))
        (assign ((x (+ x 1))))))
    (assert (= x y))))
