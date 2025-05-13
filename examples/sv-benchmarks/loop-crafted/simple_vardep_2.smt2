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
  ((i Int) (j Int) (k Int))
  (sequence
    (assign ((i 0)))
    (assign ((j 0)))
    (assign ((k 0)))
    (while
      (< k 268435455)
      (sequence
        (assign ((i (+ i 1))))
        (assign ((j (+ j 2))))
        (assign ((k (+ k 3))))
        (assert
          (and (= k (* 3 i)) (= j (* 2 i))))))))
