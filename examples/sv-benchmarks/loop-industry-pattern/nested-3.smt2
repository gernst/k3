(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var last Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((a Int) (b Int) (c Int) (st Int))
  (sequence
    (assign ((last 0)))
    (havoc (last))
    (assign ((a 0)))
    (assign ((b 0)))
    (assign ((c 0)))
    (assign ((st 0)))
    (while
      (not (= 1 0))
      (sequence
        (assign ((st 1)))
        (assign ((c 0)))
        (while
          (< c 200000)
          (sequence
            (if (= c last) (assign ((st 0))))
            (assign ((c (+ c 1))))))
        (if
          (and (= st 0) (= c (+ last 1)))
          (sequence
            (assign ((a (+ a 3))))
            (assign ((b (+ b 3)))))
          (sequence
            (assign ((a (+ a 2))))
            (assign ((b (+ b 2))))))
        (if
          (and (= c last) (= st 0))
          (assign ((a (+ a 1)))))
        (assert
          (and (= a b) (= c 200000)))))))
