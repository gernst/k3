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
  ((lo Int) (mid Int) (hi Int))
  (sequence
    (assign ((lo 0)))
    (havoc (mid))
    (if
      (not
        (and (< 0 mid) (<= mid 1000000)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((hi (* 2 mid))))
    (while
      (< 0 mid)
      (sequence
        (assign ((lo (+ lo 1))))
        (assign ((hi (- hi 1))))
        (assign ((mid (- mid 1))))))
    (assert (= lo hi))
    (assign ((|c#result| 0)))
    (return)))
