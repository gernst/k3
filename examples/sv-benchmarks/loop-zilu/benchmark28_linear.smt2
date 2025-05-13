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
    (if
      (not (< (* i i) (* j j)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i j)
      (sequence
        (assign ((j (- j i))))
        (if
          (< j i)
          (sequence
            (assign ((j (+ j i))))
            (assign ((i (- j i))))
            (assign ((j (- j i))))))))
    (assert (= j i))
    (assign ((|c#result| 0)))
    (return)))
