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
    (z__VERIFIER_LA_tmp0 Int)
    (__VERIFIER_LA_iterations0
      Int)
    (z__VERIFIER_LA_old_tmp0
      Int))
  (sequence
    (assign ((x 0)))
    (assign ((y 0)))
    (assign ((z 0)))
    (while
      (< x 268435455)
      (sequence
        (assign ((y 0)))
        (while
          (< y 268435455)
          (sequence
            (assign ((z 0)))
            (if
              (< z 268435455)
              (sequence
                (assign
                  ((z__VERIFIER_LA_tmp0 z)))
                (assign
                  ((__VERIFIER_LA_iterations0
                      (div
                        (- 268435455 z__VERIFIER_LA_tmp0)
                        1))))
                (assign
                  ((z__VERIFIER_LA_old_tmp0
                      z)))
                (assign
                  ((z
                      (+
                        (*
                          __VERIFIER_LA_iterations0
                          1)
                        z__VERIFIER_LA_old_tmp0))))))
            (assert
              (not
                (not (= (mod z 4) 0))))
            (assign ((y (+ y 1))))))
        (assert
          (not
            (not (= (mod y 2) 0))))
        (assign ((x (+ x 1))))))
    (assert
      (not
        (not (= (mod x 2) 0))))
    (assign ((|c#result| 0)))
    (return)))
