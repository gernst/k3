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
  ((w Int) (x Int) (y Int) (z Int) (nondet_uint$1 Int))
  (sequence
    (assign ((x w)))
    (assign ((y (+ w 1))))
    (assign ((z (+ x 1))))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_uint$1 0)))
          (break))
        (assign ((y (+ y 1))))
        (assign ((z (+ z 1))))))
    (assert (= y z))
    (assign ((|c#result| 0)))
    (return)))
