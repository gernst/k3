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
  ((a Int) (b Int) (c Int) (d Int) (e Int))
  (sequence
    (assign ((a 6)))
    (assign ((b 6)))
    (assign ((c 6)))
    (assign ((d 6)))
    (assign ((e 6)))
    (assign ((a 0)))
    (while
      (< a 6)
      (sequence
        (assign ((b 0)))
        (while
          (< b 6)
          (sequence
            (assign ((c 0)))
            (while
              (< c 6)
              (sequence
                (assign ((d 0)))
                (while
                  (< d 6)
                  (sequence
                    (assign ((e 0)))
                    (while
                      (< e 6)
                      (assign ((e (+ e 1)))))
                    (assign ((d (+ d 1))))))
                (assign ((c (+ c 1))))))
            (assign ((b (+ b 1))))))
        (assign ((a (+ a 1))))))
    (if
      (not
        (and (= a 6) (= b 6) (= c 6) (= d 6) (= e 6)))
      (assert false))
    (assign ((|c#result| 1)))
    (return)))
