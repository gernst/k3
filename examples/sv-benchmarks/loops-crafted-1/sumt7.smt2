(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var SIZE Int)
(define-proc
  main
  ()
  ((|c#result| Int))
  ((n Int) (i Int) (k Int) (j Int) (l Int) (v1 Int) (v2 Int) (v3 Int) (v4 Int))
  (sequence
    (assign ((SIZE 20000001)))
    (assign ((n 0)))
    (assign ((i 0)))
    (assign ((k 0)))
    (assign ((j 0)))
    (assign ((l 0)))
    (assign ((v1 0)))
    (assign ((v2 0)))
    (assign ((v3 0)))
    (assign ((v4 0)))
    (havoc (n))
    (if
      (not (<= n SIZE))
      (sequence
        (assign ((|c#result| 0)))
        (return)))
    (while
      (< l n)
      (sequence
        (if
          (not
            (not (= (mod l 7) 0)))
          (assign ((v1 (+ v1 1))))
          (if
            (not
              (not (= (mod l 6) 0)))
            (assign ((v2 (+ v2 1))))
            (if
              (not
                (not (= (mod l 5) 0)))
              (assign ((v3 (+ v3 1))))
              (if
                (not
                  (not (= (mod l 4) 0)))
                (assign ((v4 (+ v4 1))))
                (if
                  (not
                    (not (= (mod l 3) 0)))
                  (assign ((i (+ i 1))))
                  (if
                    (not
                      (not (= (mod l 2) 0)))
                    (assign ((j (+ j 1))))
                    (assign ((k (+ k 1))))))))))
        (assign ((l (+ l 1))))
        (assert
          (=
            (+
              (+
                (+ (+ (+ (+ i j) k) v1) v2)
                v3)
              v4)
            l))))
    (assign ((|c#result| 0)))
    (return)))
