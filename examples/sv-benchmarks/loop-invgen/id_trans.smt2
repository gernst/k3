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
  ((idBitLength Int)
    (material_length Int)
    (nlen Int)
    (j Int)
    (k Int))
  (sequence
    (havoc (nlen))
    (havoc (idBitLength))
    (havoc (material_length))
    (if
      (not
        (= nlen (div idBitLength 32)))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (assign ((j 0)))
    (while
      (and
        (< j (div idBitLength 8))
        (< j material_length))
      (sequence
        (assert (<= 0 j))
        (assert
          (< j material_length))
        (assert (<= 0 (div j 4)))
        (assert (< (div j 4) nlen))
        (assign ((j (+ j 1))))))
    (assign ((|c#result| 0)))
    (return)))
