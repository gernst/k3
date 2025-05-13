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
      (not
        (and (< x 100) (< y 100)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (and (< x 100) (< y 100))
      (sequence
        (assign ((x (+ x 1))))
        (assign ((y (+ y 1))))))
    (assert
      (or (= x 100) (= y 100)))
    (assign ((|c#result| 0)))
    (return)))
