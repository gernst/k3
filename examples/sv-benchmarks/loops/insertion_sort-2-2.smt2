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
  ((SIZE Int) (i Int) (j Int) (k Int) (key Int) (v (Array Int Int)) (nondet_int$1 Int))
  (sequence
    (if
      (<= (div 4000000000 4) SIZE)
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((j 0)))
    (while
      (< j SIZE)
      (sequence
        (assign
          ((v
              (store v j nondet_int$1))))
        (assign ((j (+ j 1))))))
    (assign ((j 1)))
    (while
      (< j SIZE)
      (sequence
        (assign ((key (select v j))))
        (assign ((i (- j 1))))
        (while
          (and (<= 0 i) (< key (select v i)))
          (sequence
            (assign
              ((v
                  (store v (+ i 1) (select v i)))))
            (assign ((i (- i 1))))))
        (assign
          ((v
              (store v (+ i 1) key))))
        (assign ((j (+ j 1))))))
    (assign ((k 1)))
    (while
      (< k SIZE)
      (sequence
        (assert
          (<= (select v (- k 1)) (select v k)))
        (assign ((k (+ k 1))))))
    (assign ((|c#result| 0)))
    (return)))
