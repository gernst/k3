(declare-datatypes ((|c#void| 0)) (((|c#void|))))
(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var x Int)
(define-proc
  ()
  ((|c#result| |c#void|))
  ()
  (sequence
    (while
      (not (= 1 0))
      (sequence (assign ((x 1))) (break)))
    (return)))
(define-proc
  ()
  ((|c#result| Int))
  ((eval$1 |c#void|))
  (sequence
    (assign ((x 0)))
    (while
      (not (= 1 0))
      (sequence
        (call eval () (eval$1))
        (assert (= x 0))))
    (assert (= x 0))
    (assign ((|c#result| 0)))
    (return)))
