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
  ((x Int) (y Int) (z Int) (w Int) (v Int))
  (sequence
    (assign ((x 0)))
    (assign ((y 0)))
    (assign ((z 0)))
    (assign ((w 0)))
    (assign ((v 0)))
    (assign ((w 0)))
    (while
      (< w 268435455)
      (sequence
        (assign ((x 0)))
        (while
          (< x 10)
          (sequence
            (assign ((y 0)))
            (while
              (< y 10)
              (sequence
                (assign ((z 0)))
                (while
                  (< z 10)
                  (sequence
                    (assign ((v 0)))
                    (while
                      (< v 10)
                      (assign ((v (+ v 1)))))
                    (assert
                      (not (= (mod v 4) 0)))
                    (assign ((z (+ z 1))))))
                (assign ((y (+ y 1))))))
            (assign ((x (+ x 1))))))
        (assign ((w (+ w 1))))))
    (assign ((|c#result| 0)))
    (return)))
