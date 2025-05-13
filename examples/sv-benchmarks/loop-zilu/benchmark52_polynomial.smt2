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
  ((i Int))
  (sequence
    (if
      (not
        (and (< i 10) (< (- 10) i)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< (* i i) 100)
      (assign ((i (+ i 1)))))
    (assert (= i 10))
    (assign ((|c#result| 0)))
    (return)))
