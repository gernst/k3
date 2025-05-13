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
    (y__VERIFIER_LA_tmp0 Int)
    (__VERIFIER_LA_iterations0
      Int)
    (x__VERIFIER_LA_old_tmp0
      Int)
    (y__VERIFIER_LA_old_tmp0
      Int))
  (sequence
    (assign ((x 1)))
    (assign ((y 0)))
    (if
      (< y 1024)
      (sequence
        (assign
          ((y__VERIFIER_LA_tmp0 y)))
        (assign
          ((__VERIFIER_LA_iterations0
              (div
                (- 1024 y__VERIFIER_LA_tmp0)
                1))))
        (assign
          ((x__VERIFIER_LA_old_tmp0
              x)))
        (assign
          ((x
              (+
                (+
                  (*
                    __VERIFIER_LA_iterations0
                    0)
                  (*
                    x__VERIFIER_LA_old_tmp0
                    0))
                0))))
        (assign
          ((y__VERIFIER_LA_old_tmp0
              y)))
        (assign
          ((y
              (+
                (*
                  __VERIFIER_LA_iterations0
                  1)
                y__VERIFIER_LA_old_tmp0))))))
    (assert (= x 1))))
