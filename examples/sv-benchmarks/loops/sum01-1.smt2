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
  ((i Int) (n Int) (sn Int))
  (sequence
    (assign ((sn 0)))
    (assign ((i 1)))
    (while
      (<= i n)
      (sequence
        (if
          (< i 10)
          (assign ((sn (+ sn 2)))))
        (assign ((i (+ i 1))))))
    (assert
      (or (= sn (* n 2)) (= sn 0)))))
