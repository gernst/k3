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
  ((x Int) (nondet_int$1 Int))
  (sequence
    (assign ((x 0)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_int$1 0)))
          (break))
        (assign ((x (+ x 4))))))
    (assert
      (not
        (not (= (mod x 4) 0))))
    (assign ((|c#result| 0)))
    (return)))
