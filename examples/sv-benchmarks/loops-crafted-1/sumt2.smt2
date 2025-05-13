(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var SIZE Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((n Int) (i Int) (j Int) (l Int))
  (sequence
    (assign ((SIZE 20000001)))
    (assign ((l 0)))
    (havoc (n))
    (if
      (not (<= n SIZE))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((i 0)))
    (assign ((j 0)))
    (assign ((l 0)))
    (while
      (< l n)
      (sequence
        (if
          (not
            (not (= (mod l 2) 0)))
          (assign ((i (+ i 1))))
          (assign ((j (+ j 1)))))
        (assign ((l (+ l 1))))))
    (assert (= (+ i j) l))
    (assign ((|c#result| 0)))
    (return)))
