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
  ((i Int) (j Int) (r Int))
  (sequence
    (if
      (not (< (+ i j) r))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< 0 i)
      (sequence
        (assign ((i (- i 1))))
        (assign ((j (+ j 1))))))
    (assert (< (+ i j) r))
    (assign ((|c#result| 0)))
    (return)))
