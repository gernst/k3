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
  ((SIZE Int)
    (j Int)
    (k Int)
    (array (Array Int Int))
    (menor Int)
    (nondet_int$1 Int))
  (sequence
    (assign ((SIZE 1)))
    (havoc (menor))
    (assign ((j 0)))
    (while
      (< j SIZE)
      (sequence
        (assign
          ((array
              (store array j nondet_int$1))))
        (if
          (<= (select array j) menor)
          (assign
            ((menor (select array j)))))
        (assign ((j (+ j 1))))))
    (assert
      (< menor (select array 0)))
    (assign ((|c#result| 0)))
    (return)))
