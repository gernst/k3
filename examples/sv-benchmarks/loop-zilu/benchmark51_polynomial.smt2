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
  ((x Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not
        (and (<= 0 x) (<= x 50)))
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
        (if
          (< 50 x)
          (assign ((x (+ x 1)))))
        (if
          (= x 0)
          (assign ((x (+ x 1))))
          (assign ((x (- x 1)))))))
    (assert
      (and (<= 0 x) (<= x 50)))
    (assign ((|c#result| 0)))
    (return)))
