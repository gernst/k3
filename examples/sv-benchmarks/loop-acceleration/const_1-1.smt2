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
    (assign ((y 0)))
    (while
      (< y 1024)
      (sequence
        (assign ((x 0)))
        (assign ((y (+ y 1))))))
    (assert (= x 0))))
