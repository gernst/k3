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
  ((a Int) (b Int) (c Int) (d Int) (e Int) (uint32_max Int))
  (sequence
    (assign
      ((uint32_max 4294967295)))
    (assign ((a 0)))
    (while
      (< a (- uint32_max 1))
      (sequence
        (assign ((b 0)))
        (while
          (< b (- uint32_max 1))
          (sequence
            (assign ((c 0)))
            (while
              (< c (- uint32_max 1))
              (sequence
                (assign ((d 0)))
                (while
                  (< d (- uint32_max 1))
                  (sequence
                    (assign ((e 0)))
                    (while
                      (< e (- uint32_max 1))
                      (sequence
                        (if
                          (and
                            (= a b)
                            (= b c)
                            (= c d)
                            (= d e)
                            (= e (- uint32_max 2)))
                          (assert false))
                        (assign ((e (+ e 1))))))
                    (assign ((d (+ d 1))))))
                (assign ((c (+ c 1))))))
            (assign ((b (+ b 1))))))
        (assign ((a (+ a 1))))))
    (assign ((|c#result| 0)))
    (return)))
