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
  ((i Int) (j Int) (x Int) (y Int))
  (sequence
    (havoc (i))
    (havoc (j))
    (if
      (not
        (and (<= 0 i) (<= 0 j)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((x i)))
    (assign ((y j)))
    (while
      (not (= x 0))
      (sequence
        (assign ((x (- x 1))))
        (assign ((y (- y 1))))))
    (if (= i j) (assert (= y 0)))
    (assign ((|c#result| 0)))
    (return)))
