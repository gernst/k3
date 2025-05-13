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
  ((N_LIN Int)
    (N_COL Int)
    (j Int)
    (k Int)
    (matriz
      (Array Int (Array Int Int)))
    (maior Int)
    (nondet_int$1 Int))
  (sequence
    (havoc (maior))
    (assign ((j 0)))
    (while
      (< j N_COL)
      (sequence
        (assign ((k 0)))
        (while
          (< k N_LIN)
          (sequence
            (assign
              ((matriz
                  (store
                    matriz
                    j
                    (store (select matriz j) k nondet_int$1)))))
            (if
              (<
                maior
                (select (select matriz j) k))
              (assign
                ((maior
                    (select (select matriz j) k)))))
            (assign ((k (+ k 1))))))
        (assign ((j (+ j 1))))))
    (assign ((j 0)))
    (while
      (< j N_COL)
      (sequence
        (assign ((k 0)))
        (while
          (< k N_LIN)
          (sequence
            (assert
              (<
                (select (select matriz j) k)
                maior))
            (assign ((k (+ k 1))))))
        (assign ((j (+ j 1))))))))
