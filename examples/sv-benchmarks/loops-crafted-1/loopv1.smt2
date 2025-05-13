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
  ((n Int) (i Int) (j Int) (nondet_int$1 Int))
  (sequence
    (assign ((SIZE 50000001)))
    (havoc (n))
    (if
      (not (<= n SIZE))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (assign ((j 0)))
    (while
      (< i n)
      (if
        (not (= nondet_int$1 0))
        (assign ((i (+ i 6))))
        (assign ((i (+ i 3))))))
    (assert (= (mod i 3) 0))
    (assign ((|c#result| 0)))
    (return)))
