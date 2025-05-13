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
      (< index 10000)
      (sequence
        (assign
          ((array
              (store array index tmp))))
        (assign
          ((index (+ index 1))))
        (assign ((tmp (+ tmp 2))))))
    (assign ((index 0)))
    (while
      (< index 10000)
      (sequence
        (assert
          (or
            (= (select array index) (* 2 index))
            (= (select array index) 0)))
        (assign
          ((index (+ index 1))))))))
