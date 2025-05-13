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
  ((i Int))
  (sequence
    (assign ((i 0)))
    (while
      (< i 1000000)
      (assign ((i (+ i 1)))))
    (assert (= i 1000000))
    (assign ((|c#result| 0)))
    (return)))
