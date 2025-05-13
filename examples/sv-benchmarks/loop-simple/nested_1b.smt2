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
  ((a Int))
  (sequence
    (assign ((a 6)))
    (assign ((a 0)))
    (while
      (< a 6)
      (assign ((a (+ a 1)))))
    (if (= a 6) (assert false))
    (assign ((|c#result| 1)))
    (return)))
