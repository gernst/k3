(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(define-proc
  f
  ((z Int))
  ((|c#result| Int))
  ()
  (sequence
    (assign
      ((|c#result| (+ z 2))))
    (return)))
(define-proc
  main
  ()
  ((|c#result| Int))
  ((x Int) (f$1 Int))
  (sequence
    (assign ((x 0)))
    (while
      (< x 268435455)
      (sequence (call f (x) (f$1)) (assign ((x f$1)))))
    (assert
      (not
        (not (= (mod x 2) 0))))))
