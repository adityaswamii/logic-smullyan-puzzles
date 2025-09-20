; 109.
; We have two people A,B, each of whom is either a knight or a knave.
; A says: "If I am a knight, then so is B."
; Can it be determined what A and B are?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const B Role)

; Statement spoken by A: If I am a knight, then so is B.
(define-fun stmtA () Bool (=> (= A Knight) (= B Knight)))

; Knight/Knave rules for A
(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)
