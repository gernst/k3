(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-proc ((cond Int)) ())
(define-proc
  main
  ()
  ((|c#result| Int))
  ((i Int) (n Int) (sn Int))
  (sequence
    (assign ((sn 0)))
    (if
      (not
        (and (< n 1000) (<= (- 1000) n)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 1)))
    (while
      (<= i n)
      (sequence
        (assign ((sn (+ sn 2))))
        (assign ((i (+ i 1))))))
    (assert
      (or (= sn (* n 2)) (= sn 0)))))
