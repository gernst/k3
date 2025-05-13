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
  ((A (Array Int Int)) (i Int) (nondet_int$1 Int))
  (sequence
    (assign ((i 0)))
    (while
      (< i 1024)
      (sequence
        (assign
          ((A
              (store A i nondet_int$1))))
        (assign ((i (+ i 1))))))
    (assign ((i 0)))
    (while
      (not (= (select A i) 0))
      (sequence
        (if (<= 1024 i) (break))
        (assign ((i (+ i 1))))))
    (assert (<= i 1024))))
