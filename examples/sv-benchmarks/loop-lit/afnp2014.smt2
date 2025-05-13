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
  ((x Int) (y Int) (x$2 Bool) (nondet_int$1 Int))
  (sequence
    (assign ((x 1)))
    (assign ((y 0)))
    (assign ((x$2 (< y 1000))))
    (if
      x$2
      (assign
        ((x$2
            (not (= nondet_int$1 0))))))
    (while
      true
      (sequence
        (if (not x$2) (break))
        (assign ((x (+ x y))))
        (assign ((y (+ y 1))))))
    (assert (<= y x))
    (assign ((|c#result| 0)))
    (return)))
