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
  ((x Int))
  (sequence
    (if
      (not (< x 0))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< x 10)
      (assign ((x (+ x 1)))))
    (assert (= x 10))
    (assign ((|c#result| 0)))
    (return)))
