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
  ((x Int) (y Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not
        (and (= x 1) (= y 1)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_bool$1 0)))
          (break))
        (assign ((x (+ x y))))
        (assign ((y x)))))
    (assert (<= 1 y))
    (assign ((|c#result| 0)))
    (return)))
