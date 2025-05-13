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
  ((i Int) (j Int) (a Int) (b Int) (flag Int) (nondet_int$1 Int))
  (sequence
    (assign ((a 0)))
    (assign ((b 0)))
    (assign ((j 1)))
    (if (not (= flag 0)) (assign ((i 0))) (assign ((i 1))))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_int$1 0)))
          (break))
        (assign ((a (+ a 1))))
        (assign ((b (+ b (- j i)))))
        (assign ((i (+ i 2))))
        (if
          (= (mod i 2) 0)
          (assign ((j (+ j 2))))
          (assign ((j (+ j 1)))))))
    (if (not (= flag 0)) (assert (= a b)))
    (assign ((|c#result| 0)))
    (return)))
