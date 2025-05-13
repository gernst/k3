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
  ((i Int) (pvlen Int) (tmp___1 Int) (k Int) (n Int) (nondet_int$1 Int) (x$2 Bool))
  (sequence
    (assign ((k 0)))
    (assign ((i 0)))
    (havoc (pvlen))
    (assign
      ((x$2
          (not (= nondet_int$1 0)))))
    (if
      x$2
      (assign
        ((x$2 (<= i 1000000)))))
    (while
      true
      (sequence
        (if (not x$2) (break))
        (assign ((i (+ i 1))))))
    (if (< pvlen i) (assign ((pvlen i))))
    (assign ((i 0)))
    (assign
      ((x$4
          (not (= nondet_int$3 0)))))
    (if
      x$4
      (assign
        ((x$4 (<= i 1000000)))))
    (while
      true
      (sequence
        (if (not x$4) (break))
        (assign ((tmp___1 i)))
        (assign ((i (+ i 1))))
        (assign ((k (+ k 1))))))
    (assign ((j 0)))
    (assign ((n i)))
    (while
      (not (= 1 0))
      (sequence
        (assert (<= 0 k))
        (assign ((k (- k 1))))
        (assign ((i (- i 1))))
        (assign ((j (+ j 1))))
        (if (<= n j) (break))))
    (assign ((|c#result| 0)))
    (return)))
