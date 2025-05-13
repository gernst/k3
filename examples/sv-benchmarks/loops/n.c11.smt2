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
  ((a (Array Int Int)) (len Int) (i Int) (nondet_bool$1 Int))
  (sequence
    (assign ((len 0)))
    (while
      true
      (sequence
        (if
          (not
            (not (= nondet_bool$1 0)))
          (break))
        (if (= len 4) (assign ((len 0))))
        (assign
          ((a (store a len 0))))
        (assign ((len (+ len 1))))))
    (assert
      (and (<= 0 len) (< len 5)))
    (assign ((|c#result| 1)))
    (return)))
