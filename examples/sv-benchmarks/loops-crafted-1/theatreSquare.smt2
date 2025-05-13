(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(define-proc
  correct_version
  ((n Int) (m Int) (a Int))
  ((|c#result| Int))
  ((i Int) (j Int) (b Int) (l Int))
  (sequence
    (assign ((i 0)))
    (assign ((j 0)))
    (assign ((b 0)))
    (assign ((l 0)))
    (while
      (< b n)
      (sequence
        (assign ((b (+ b a))))
        (assign ((i (+ i 1))))))
    (while
      (< l m)
      (sequence
        (assign ((l (+ l a))))
        (assign ((j (+ j 1))))))
    (assign ((x 0)))
    (assign ((y 0)))
    (while
      (< x i)
      (sequence
        (assign ((y (+ y j))))
        (assign ((x (+ x 1))))))
    (assign ((|c#result| y)))
    (return)))
(define-proc
  student_version
  ((n Int) (m Int) (a Int))
  ((|c#result| Int))
  ((i Int) (j Int) (b Int) (l Int))
  (sequence
    (assign ((i 0)))
    (assign ((j 0)))
    (assign ((b 0)))
    (assign ((l 0)))
    (while
      (< b n)
      (sequence
        (assign ((b (+ b a))))
        (assign ((i (+ i 1))))))
    (while
      (< l m)
      (sequence
        (assign ((l (+ l a))))
        (assign ((j (+ j 1))))))
    (assign ((x 0)))
    (assign ((y 0)))
    (while
      (< x i)
      (sequence
        (assign ((y (+ y j))))
        (assign ((x (+ x 1))))))
    (assign ((|c#result| y)))
    (return)))
(define-proc
  main
  ()
  ((|c#result| Int))
  ((a Int)
    (n Int)
    (m Int)
    (n_stones1 Int)
    (n_stones2 Int)
    (correct_version$1 Int)
    (student_version$2 Int))
  (sequence
    (assign
      ((n_stones1 n_stones2)))
    (if
      (and (<= 1 n) (<= 1 m) (<= 1 a) (<= n 109) (<= m 109) (<= a 109))
      (sequence
        (call correct_version (n m a) (correct_version$1))
        (assign
          ((n_stones1 correct_version$1)))
        (call student_version (n m a) (student_version$2))
        (assign
          ((n_stones2 student_version$2)))))
    (assert
      (= n_stones1 n_stones2))
    (assign ((|c#result| 0)))
    (return)))
