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
  ((array (Array Int Int))
    (index1 Int)
    (index2 Int)
    (loop_entered Int)
    (i Int)
    (nondet_uint$1 Int))
  (sequence
    (assign ((loop_entered 0)))
    (assign ((i 0)))
    (while
      (< i 100000)
      (sequence
        (assign
          ((array
              (store array i nondet_uint$1))))
        (assign ((i (+ i 1))))))
    (havoc (index1))
    (assume (< index1 100000))
    (havoc (index2))
    (assume (< index2 100000))
    (while
      (< index1 index2)
      (sequence
        (assert
          (and (< index1 100000) (< index2 100000)))
        (assume
          (=
            (select array index1)
            (select array index2)))
        (assign
          ((index1 (+ index1 1))))
        (assign
          ((index2 (- index2 1))))
        (assign ((loop_entered 1)))))
    (if
      (not (= loop_entered 0))
      (while
        (< index2 index1)
        (sequence
          (assert
            (=
              (select array index1)
              (select array index2)))
          (assign
            ((index2 (+ index2 1))))
          (assign
            ((index1 (- index1 1)))))))))
