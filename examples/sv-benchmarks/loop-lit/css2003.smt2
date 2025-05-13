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
    (assign ((i 1)))
    (assign ((j 1)))
    (havoc (k))
    (if
      (not
        (and (<= 0 k) (<= k 1)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i 1000000)
      (sequence
        (assign ((i (+ i 1))))
        (assign ((j (+ j k))))
        (assign ((k (- k 1))))
        (assert
          (and (<= 1 (+ i k)) (<= (+ i k) 2) (<= 1 i)))))
    (assign ((|c#result| 0)))
    (return)))
