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
  ((j Int) (k Int) (n Int))
  (sequence
    (if
      (not
        (and (= j 0) (= k n) (< 0 n)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (and (< j n) (< 0 n))
      (sequence
        (assign ((j (+ j 1))))
        (assign ((k (- k 1))))))
    (assert (= k 0))
    (assign ((|c#result| 0)))
    (return)))
