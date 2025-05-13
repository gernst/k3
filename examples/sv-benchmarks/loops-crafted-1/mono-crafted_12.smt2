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
  ((x Int) (y Int) (z Int))
  (sequence
    (assign ((x 0)))
    (assign ((y 10000000)))
    (assign ((z 0)))
    (while
      (< x y)
      (sequence
        (if
          (<= 5000000 x)
          (assign ((z (+ z 2)))))
        (assign ((x (+ x 1))))))
    (assert
      (not
        (not (= (mod z 2) 0))))
    (assign ((|c#result| 0)))
    (return)))
