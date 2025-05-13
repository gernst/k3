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
  ((x Int)
    (y Int)
    (z Int)
    (w Int)
    (nondet_int$1 Int)
    (x$2 Bool)
    (nondet_int$3 Int)
    (nondet_int$4 Int))
  (sequence
    (assign ((w 0)))
    (assign ((z w)))
    (assign ((y z)))
    (assign ((x y)))
    (assign
      ((x$2
          (not (= nondet_int$1 0)))))
    (if
      x$2
      (assign ((x$2 (< y 10000)))))
    (while
      true
      (sequence
        (if (not x$2) (break))
        (if
          (not (= nondet_int$3 0))
          (sequence
            (assign ((x (+ x 1))))
            (assign ((y (+ y 100)))))
          (if
            (not (= nondet_int$4 0))
            (if
              (<= 4 x)
              (sequence
                (assign ((x (+ x 1))))
                (assign ((y (+ y 1))))))
            (if
              (and (< (* 10 w) y) (<= (* 100 x) z))
              (assign ((y (- y)))))))
        (assign ((w (+ w 1))))
        (assign ((z (+ z 10))))))
    (assert
      (and (<= 4 x) (<= y 2)))
    (assign ((|c#result| 0)))
    (return)))
