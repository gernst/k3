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
  ((i Int) (c Int))
  (sequence
    (if
      (not
        (and (= c 0) (= i 0)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< i 100)
      (sequence
        (assign ((c (+ c i))))
        (assign ((i (+ i 1))))
        (if (<= i 0) (break))))
    (assert (<= 0 c))
    (assign ((|c#result| 0)))
    (return)))
