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
    (x__VERIFIER_LA_tmp0 Int)
    (__VERIFIER_LA_iterations0
      Int)
    (x__VERIFIER_LA_old_tmp0
      Int))
  (sequence
    (assign ((x 0)))
    (if
      (< x 268435455)
      (sequence
        (assign
          ((x__VERIFIER_LA_tmp0 x)))
        (assign
          ((__VERIFIER_LA_iterations0
              (div
                (- 268435455 x__VERIFIER_LA_tmp0)
                2))))
        (assign
          ((x__VERIFIER_LA_old_tmp0
              x)))
        (assign
          ((x
              (+
                (*
                  __VERIFIER_LA_iterations0
                  2)
                x__VERIFIER_LA_old_tmp0))))))
    (assert
      (not (= (mod x 2) 0)))))
