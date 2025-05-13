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
  ((sn Int) (loop1 Int) (n1 Int) (x Int))
  (sequence
    (assign ((sn 0)))
    (assign ((x 0)))
    (while
      (not (= 1 0))
      (sequence
        (if
          (< x 10)
          (assign ((sn (+ sn 2)))))
        (assign ((x (+ x 1))))
        (assert
          (or (= sn (* x 2)) (= sn 0)))))))
