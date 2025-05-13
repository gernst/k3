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
  ((i Int) (x Int) (n Int))
  (sequence
    (assign ((i 0)))
    (assign ((x 0)))
    (if
      (not (< 0 n))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (while
      (not (= 1 0))
      (sequence
        (assert (= x 0))
        (assign ((i (+ i 1))))))
    (assert (not (= x 0)))))
