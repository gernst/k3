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
  ((i Int) (j Int))
  (sequence
    (assign ((i 0)))
    (while
      (< i 4)
      (sequence
        (assign ((j 0)))
        (while
          (< j 3)
          (sequence
            (assign ((i (+ i 1))))
            (assign ((j (+ j 2))))
            (assert (<= 0 j))
            (assert (<= j (* 2 i)))
            (assert (<= (* 2 i) (+ j 6)))
            (assert (<= j 4))))
        (assert (<= 0 j))
        (assert (<= j (* 2 i)))
        (assert (<= (* 2 i) (+ j 6)))
        (assert (<= j 4))
        (assign
          ((i
              (+ (- i (div j 2)) 1))))))
    (assign ((|c#result| 0)))
    (return)))
