; 113.
; Given two people, A,B, both of whom are knights or knaves.
; A says, "If B is a knight then I am a knave."
; What are A and B?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const B Role)

(define-fun stmtA () Bool (=> (= B Knight) (= A Knave)))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)

