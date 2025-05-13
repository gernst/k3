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
  ((xa Int) (ya Int))
  (sequence
    (if
      (not (< 0 (+ xa ya)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< 0 xa)
      (sequence
        (assign ((xa (- xa 1))))
        (assign ((ya (+ ya 1))))))
    (assert (<= 0 ya))
    (assign ((|c#result| 0)))
    (return)))
