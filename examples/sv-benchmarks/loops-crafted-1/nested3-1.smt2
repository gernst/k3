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
    (assign ((y 0)))
    (assign ((z 0)))
    (while
      (< x 268435455)
      (sequence
        (assign ((y 0)))
        (while
          (< y 268435455)
          (sequence
            (assign ((z 0)))
            (while
              (< z 268435455)
              (assign ((z (+ z 1)))))
            (assert
              (not (= (mod z 4) 0)))
            (assign ((y (+ y 1))))))
        (assert
          (not (= (mod y 2) 0)))
        (assign ((x (+ x 1))))))
    (assert
      (not (= (mod x 2) 0)))
    (assign ((|c#result| 0)))
    (return)))
