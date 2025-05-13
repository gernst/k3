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
  ((n Int) (v Int) (s Int) (i Int))
  (sequence
    (if
      (= n 0)
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((v 0)))
    (assign ((s 0)))
    (assign ((i 0)))
    (while
      (< i n)
      (sequence
        (havoc (v))
        (assign ((s (+ s v))))
        (assign ((i (+ i 1))))))
    (if
      (< s v)
      (sequence
        (assert false)
        (assign ((|c#result| 1)))
        (return)))
    (if
      (< 65025 s)
      (sequence
        (assert false)
        (assign ((|c#result| 1)))
        (return)))
    (assign ((|c#result| 0)))
    (return)))
