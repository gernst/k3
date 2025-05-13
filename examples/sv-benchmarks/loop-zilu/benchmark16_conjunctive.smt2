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
  ((i Int) (k Int) (nondet_bool$1 Int))
  (sequence
    (if
      (not
        (and (<= 0 k) (<= k 1) (= i 1)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_bool$1 0)))
          (break))
        (assign ((i (+ i 1))))
        (assign ((k (- k 1))))))
    (assert
      (and (<= 1 (+ i k)) (<= (+ i k) 2) (<= 1 i)))
    (assign ((|c#result| 0)))
    (return)))
