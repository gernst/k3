(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var SIZE Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((i Int) (j Int) (nondet_int$1 Int))
  (sequence
    (assign ((SIZE 50000001)))
    (assign ((i 0)))
    (assign ((j 0)))
    (while
      (< i SIZE)
      (if
        (not (= nondet_int$1 0))
        (assign ((i (+ i 8))))
        (assign ((i (+ i 4))))))
    (assign ((j (div i 4))))
    (assert (= (* j 4) i))
    (assign ((|c#result| 0)))
    (return)))
