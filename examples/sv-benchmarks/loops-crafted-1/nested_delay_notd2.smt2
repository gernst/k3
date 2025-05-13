(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var last Int)
(declare-var SIZE Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((a Int) (b Int) (c Int) (st Int) (d Int))
  (sequence
    (assign ((last 0)))
    (assign ((SIZE 20)))
    (havoc (last))
    (assume (< 0 last))
    (assign ((a 0)))
    (assign ((b 0)))
    (assign ((c 0)))
    (assign ((st 0)))
    (assign ((d 0)))
    (while
      (not (= 1 0))
      (sequence
        (assign ((st 1)))
        (assign ((c 0)))
        (while
          (< c SIZE)
          (sequence
            (if (<= last c) (assign ((st 0))))
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
          (assign ((a (+ a 1))))
          (if
            (and (= st 1) (<= SIZE last))
            (assign ((d (+ d 1))))))
        (if
          (= d SIZE)
          (sequence (assign ((a 0))) (assign ((b 1)))))
        (assert
          (and (= a b) (= c SIZE)))))
    (assign ((|c#result| 0)))
    (return)))
