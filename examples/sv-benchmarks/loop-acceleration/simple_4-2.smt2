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
  ((x Int))
  (sequence
    (assign ((x 268435440)))
    (while
      (< 0 x)
      (assign ((x (- x 2)))))
    (assert
      (not
        (not (= (mod x 2) 0))))))
