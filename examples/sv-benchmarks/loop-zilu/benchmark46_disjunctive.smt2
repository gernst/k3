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
  ((x Int) (y Int) (z Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not
        (or (< 0 y) (< 0 x) (< 0 z)))
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
          (< 0 x)
          (assign ((x (+ x 1)))))
        (if
          (< 0 y)
          (assign ((y (+ y 1))))
          (assign ((z (+ z 1)))))))
    (assert
      (or (< 0 x) (< 0 y) (< 0 z)))
    (assign ((|c#result| 0)))
    (return)))
