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
  ((x Int) (m Int) (n Int) (nondet_int$1 Int))
  (sequence
    (assign ((x 0)))
    (assign ((m 0)))
    (while
      (< x n)
      (sequence
        (if
          (not (= nondet_int$1 0))
          (assign ((m x))))
        (assign ((x (+ x 1))))))
    (assert
      (or (<= 0 m) (<= n 0)))
    (assert
      (or (< m n) (<= n 0)))
    (assign ((|c#result| 0)))
    (return)))
