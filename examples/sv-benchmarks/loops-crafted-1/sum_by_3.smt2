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
  ((n Int) (i Int) (k Int))
  (sequence
    (assign ((SIZE 20000001)))
    (havoc (n))
    (if
      (not (<= n SIZE))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (while
      (< i n)
      (assign ((i (+ i 1)))))
    (assign ((j i)))
    (while
      (< j n)
      (assign ((j (+ j 1)))))
    (assign ((k j)))
    (while
      (< k n)
      (assign ((k (+ k 1)))))
    (assert
      (<=
        (div (+ (+ i j) k) 3)
        SIZE))
    (assign ((|c#result| 0)))
    (return)))
