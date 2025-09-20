; 112.
; A says, "If I'm a knight, then two plus two equals five." What would you conclude?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)

; Statement: If I'm a knight then 2+2=5 (which is false)
(define-fun stmtA () Bool (=> (= A Knight) false))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)

