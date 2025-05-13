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
  ((A (Array Int Int))
    (B (Array Int Int))
    (i Int)
    (tmp Int)
    (nondet_int$1 Int)
    (nondet_int$2 Int))
  (sequence
    (assign ((i 0)))
    (while
      (< i 2048)
      (sequence
        (assign
          ((A
              (store A i nondet_int$1))))
        (assign
          ((B
              (store B i nondet_int$2))))
        (assign ((i (+ i 1))))))
    (assign ((i 0)))
    (while
      (< i 2048)
      (sequence
        (assign ((tmp (select A i))))
        (assign
          ((B (store B i tmp))))
        (assign ((i (+ i 1))))))
    (assert
      (not
        (=
          (select A (div 2048 2))
          (select B (div 2048 2)))))))
