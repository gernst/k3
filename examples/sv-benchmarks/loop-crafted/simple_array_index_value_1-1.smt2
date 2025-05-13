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
    (index Int))
  (sequence
    (assign ((index 0)))
    (while
      (< index 1000)
      (sequence
        (assign
          ((array
              (store array index (mod index 2)))))
        (assign
          ((index (+ index 1))))))
    (assign ((index 0)))
    (while
      (< index 1000)
      (sequence
        (if
          (= (mod index 2) 0)
          (assert
            (= (select array index) 0))
          (assert
            (not
              (= (select array index) 0))))
        (assign
          ((index (+ index 1))))))))
