(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(define-proc
  main
  ((argc Int)
    (argv
      (|c#ptr| (|c#ptr| Int))))
  ((|c#result| Int))
  ((n Int) (l Int) (r Int) (i Int) (j Int) (nondet_int$3 Int) (nondet_int$4 Int))
  (sequence
    (havoc (n))
    (if
      (not
        (and (<= 1 n) (<= n 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign
      ((l (+ (div n 2) 1))))
    (assign ((r n)))
    (if
      (< 1 l)
      (assign ((l (- l 1))))
      (assign ((r (- r 1)))))
    (while
      (< 1 r)
      (sequence
        (assign ((i l)))
        (assign ((j (* 2 l))))
        (while
          (<= j r)
          (sequence
            (if
              (< j r)
              (sequence
                (assert (<= 1 j))
                (assert (<= j n))
                (assert (<= 1 (+ j 1)))
                (assert (<= (+ j 1) n))
                (if
                  (not (= nondet_int$3 0))
                  (assign ((j (+ j 1)))))))
            (assert (<= 1 j))
            (assert (<= j n))
            (if
              (not (= nondet_int$4 0))
              (break))
            (assert (<= 1 i))
            (assert (<= i n))
            (assert (<= 1 j))
            (assert (<= j n))
            (assign ((i j)))
            (assign ((j (* 2 j))))))
        (if
          (< 1 l)
          (sequence
            (assert (<= 1 l))
            (assert (<= l n))
            (assign ((l (- l 1)))))
          (sequence
            (assert (<= 1 r))
            (assert (<= r n))
            (assign ((r (- r 1))))))))
    (assign ((|c#result| 0)))
    (return)))
