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
  ((array (Array Int Int))
    (index Int)
    (tmp Int))
  (sequence
    (assign ((index 0)))
    (assign ((tmp 0)))
    (while
      (not (= 1 0))
      (sequence
        (havoc (index))
        (if (<= 10000 index) (break))
        (assign
          ((array
              (store array index index))))
        (assign ((tmp index)))))
    (assert
      (and
        (< tmp 10000)
        (= (select array tmp) tmp)))))
