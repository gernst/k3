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
  ((n Int) (i Int) (k Int) (j Int))
  (sequence
    (assign ((SIZE 20000001)))
    (havoc (n))
    (if
      (not (<= n SIZE))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((k 0)))
    (assign ((j k)))
    (assign ((i j)))
    (while
      (< i n)
      (sequence
        (assign ((i (+ i 3))))
        (if
          (not (= (mod i 2) 0))
          (assign ((j (+ j 3))))
          (assign ((k (+ k 3)))))
        (if
          (< 0 n)
          (assert (<= (div i 2) j)))))
    (assign ((|c#result| 0)))
    (return)))
