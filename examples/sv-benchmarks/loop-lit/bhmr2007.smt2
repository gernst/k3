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
  ((i Int) (n Int) (a Int) (b Int) (nondet_int$1 Int))
  (sequence
    (assign ((i 0)))
    (assign ((a 0)))
    (assign ((b 0)))
    (havoc (n))
    (if
      (not
        (and (<= 0 n) (<= n 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i n)
      (sequence
        (if
          (not (= nondet_int$1 0))
          (sequence
            (assign ((a (+ a 1))))
            (assign ((b (+ b 2)))))
          (sequence
            (assign ((a (+ a 2))))
            (assign ((b (+ b 1))))))
        (assign ((i (+ i 1))))))
    (assert (= (+ a b) (* 3 n)))
    (assign ((|c#result| 0)))
    (return)))
