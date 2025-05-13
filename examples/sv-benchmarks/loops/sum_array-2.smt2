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
  ((M Int)
    (A (Array Int Int))
    (B (Array Int Int))
    (C (Array Int Int))
    (i Int)
    (nondet_int$1 Int))
  (sequence
    (assign ((i 0)))
    (while
      (< i M)
      (sequence
        (assign
          ((A
              (store A i nondet_int$1))))
        (if
          (not
            (<= (select A i) 1000000))
          (sequence
            (assign ((|c#result| 0)))
            (return)))
        (assign ((i (+ i 1))))))
    (assign ((i 0)))
    (while
      (< i M)
      (sequence
        (assign
          ((B
              (store B i nondet_int$3))))
        (if
          (not
            (<= (select B i) 1000000))
          (sequence
            (assign ((|c#result| 0)))
            (return)))
        (assign ((i (+ i 1))))))
    (assign ((i 0)))
    (while
      (< i M)
      (sequence
        (assign
          ((C
              (store
                C
                i
                (+ (select A i) (select B i))))))
        (assign ((i (+ i 1))))))
    (assign ((i 0)))
    (while
      (< i M)
      (sequence
        (assert
          (=
            (select C i)
            (+ (select A i) (select B i))))
        (assign ((i (+ i 1))))))))
