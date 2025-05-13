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
  ((a Int) (b Int) (res Int) (cnt Int))
  (sequence
    (if
      (not (<= a 1000000))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (if
      (not
        (and (<= 0 b) (<= b 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((res a)))
    (assign ((cnt b)))
    (while
      (< 0 cnt)
      (sequence
        (assign ((cnt (- cnt 1))))
        (assign ((res (+ res 1))))))
    (assert (= res (+ a b)))
    (assign ((|c#result| 0)))
    (return)))
