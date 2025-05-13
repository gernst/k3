(declare-sort |c#ptr| 1)
(declare-sort |c#heap| 0)
(declare-var |c#heap| |c#heap|)
(declare-fun |c#bitxor| (Int Int) Int)
(declare-fun |c#bitand| (Int Int) Int)
(declare-fun |c#bitor| (Int Int) Int)
(declare-var true Int)
(declare-var false Int)
(define-proc
  correct_version
  ((w Int))
  ((|c#result| Int))
  ((is_divisible Int) (i Int))
  (sequence
    (assign
      ((is_divisible true)))
    (if
      (< w 4)
      (assign
        ((is_divisible false)))
      (sequence
        (assign ((i 0)))
        (while
          (< i w)
          (assign ((i (+ i 2)))))
        (if
          (not (= i w))
          (assign
            ((is_divisible false))))))
    (assign
      ((|c#result| is_divisible)))
    (return)))
(define-proc
  student_version
  ((w Int))
  ((|c#result| Int))
  ((is_divisible Int) (i Int))
  (sequence
    (assign
      ((is_divisible true)))
    (if
      (< w 4)
      (assign
        ((is_divisible false)))
      (sequence
        (assign ((i 0)))
        (while
          (< i w)
          (assign ((i (+ i 2)))))
        (if
          (not (= i w))
          (assign
            ((is_divisible false))))))
    (assign
      ((|c#result| is_divisible)))
    (return)))
(define-proc
  main
  ()
  ((|c#result| Int))
  ((w Int)
    (is_divisible1 Int)
    (is_divisible2 Int)
    (correct_version$1 Int)
    (student_version$2 Int))
  (sequence
    (assign ((true 1)))
    (assign ((false 0)))
    (assign
      ((is_divisible1 true)))
    (assign
      ((is_divisible2 true)))
    (if
      (and (< 0 w) (< w 10000000))
      (sequence
        (call correct_version (w) (correct_version$1))
        (assign
          ((is_divisible1 correct_version$1)))
        (call student_version (w) (student_version$2))
        (assign
          ((is_divisible2 student_version$2)))
        (assert
          (= is_divisible1 is_divisible2))))
    (assign ((|c#result| 0)))
    (return)))
