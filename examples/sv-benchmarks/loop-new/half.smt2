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
  ((i Int) (n Int) (k Int))
  (sequence
    (assign ((i 0)))
    (assign ((n 0)))
    (if
      (not
        (and (<= k 1000000) (<= (- 1000000) k)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (while
      (< i (* 2 k))
      (sequence
        (if
          (= (mod i 2) 0)
          (assign ((n (+ n 1)))))
        (assign ((i (+ i 1))))))
    (assert (or (< k 0) (= n k)))
    (assign ((|c#result| 0)))
    (return)))
