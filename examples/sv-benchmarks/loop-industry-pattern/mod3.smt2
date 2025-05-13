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
  ((x Int) (y Int) (nondet_int$1 Int) (nondet_int$2 Int))
  (sequence
    (assign ((y 1)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_int$1 0)))
          (break))
        (if
          (= (mod x 3) 1)
          (sequence
            (assign ((x (+ x 2))))
            (assign ((y 0))))
          (if
            (= (mod x 3) 2)
            (sequence
              (assign ((x (+ x 1))))
              (assign ((y 0))))
            (if
              (not (= nondet_int$2 0))
              (sequence
                (assign ((x (+ x 4))))
                (assign ((y 1))))
              (sequence
                (assign ((x (+ x 5))))
                (assign ((y 1)))))))))
    (if
      (= y 0)
      (assert (= (mod x 3) 0)))
    (assign ((|c#result| 0)))
    (return)))
