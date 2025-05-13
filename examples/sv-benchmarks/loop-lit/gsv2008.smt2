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
    (assign ((x (- 50))))
    (havoc (y))
    (if
      (not
        (and (< (- 1000) y) (< y 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< x 0)
      (sequence
        (assign ((x (+ x y))))
        (assign ((y (+ y 1))))))
    (assert (< 0 y))
    (assign ((|c#result| 0)))
    (return)))
