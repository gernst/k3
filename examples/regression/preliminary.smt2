(declare-sort Foo 1)
(declare-var x (Foo Int))

(declare-datatypes ((|c#void| 0)) (((|c#void|))))

(declare-fun foo (Int) Int)
(declare-fun bar (Int Int) Int)

(define-fun some_invariant ((out Int)) Bool
    (> out 0))


(define-proc inc-spec
    ((in  Int))
    ((out Int))
    ()
    (!
        (assume (= out (+ in 1))
        :tag inc-spec
        :requires (> out 0)
        :ensures false)))

(define-proc inc
    ((in  Int))
    ((out Int))
    ()
    (!
        (assign ((out (+ in 1)))
        :tag inc)))

(annotate-tag inc
    :requires true)

(annotate-tag inc
    :ensures (> out in))

(define-proc test
    ((in Int))
    ((out Int))
    ((y Real))
    (sequence
        (break)
        (continue)
        (return)
        (assign ((y 1.1) (out (- in 1 2 3))))
        (! (sequence)
            :tag critical-location
            :invariant (some_invariant (+ out 1)))
        (! (sequence)
            :tag assert
            :invariant (> out 0))
        (! (assume true)
            :foo 1 :baz :bar :invariant (> out 0))))

(annotate-tag :loop :invariant false :more :stuff 42)