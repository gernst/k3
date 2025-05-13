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
  ((offset Int) (length Int) (nlen Int) (i Int) (j Int))
  (sequence
    (assign ((i 0)))
    (while
      (< i nlen)
      (sequence
        (assign ((j 0)))
        (while
          (< j 8)
          (sequence
            (assert
              (<= 0 (- (- nlen 1) i)))
            (assert
              (< (- (- nlen 1) i) nlen))
            (assign ((j (+ j 1))))))
        (assign ((i (+ i 1))))))
    (assign ((|c#result| 0)))
    (return)))
