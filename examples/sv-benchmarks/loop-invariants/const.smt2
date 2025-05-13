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
  ((s Int) (nondet_uint$1 Int) (nondet_uint$2 Int))
  (sequence
    (assign ((s 0)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_uint$1 0)))
          (break))
        (if
          (not (= s 0))
          (assign ((s (+ s 1)))))
        (if
          (not (= nondet_uint$2 0))
          (assert (= s 0)))))
    (assign ((|c#result| 0)))
    (return)))
