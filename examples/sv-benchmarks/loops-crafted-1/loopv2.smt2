(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var SIZE Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((n Int) (i Int) (j Int) (k Int))
  (sequence
    (assign ((SIZE 50000001)))
    (havoc (n))
    (if
      (not (<= n SIZE))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (assign ((j 0)))
    (while
      (< i n)
      (sequence
        (assign ((i (+ i 4))))
        (assign ((j (+ i 2))))))
    (assign ((k i)))
    (while
      (= (mod j 2) 0)
      (sequence
        (assign ((j (- j 4))))
        (assign ((k (- k 4))))))
    (assert (= (mod k 2) 0))
    (assign ((|c#result| 0)))
    (return)))
