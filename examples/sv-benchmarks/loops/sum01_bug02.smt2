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
  ((i Int) (j Int) (n Int) (sn Int))
  (sequence
    (assign ((j 10)))
    (assign ((sn 0)))
    (if
      (= n 2147483647)
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 1)))
    (while
      (<= i n)
      (sequence
        (if
          (< i j)
          (assign ((sn (+ sn 2)))))
        (assign ((j (- j 1))))
        (assign ((i (+ i 1))))))
    (assert
      (or (= sn (* n 2)) (= sn 0)))))
