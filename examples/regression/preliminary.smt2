(declare-sort Foo 1)
(declare-var x (Foo Int))

(declare-fun foo (Int) Int)
(declare-fun bar (Int Int) Int)

(define-proc test
    ((in Int))
    ((out Int))
    ((y Real))
    (sequence (break) (continue) (return)
    (assign ((y 1.1) (out (- in 1 2 3))))
    (! (assume true)
        :foo 1 :baz :bar :invariant (> out 0))))

(annotate-tag :loop :invariant false :more :stuff 42)