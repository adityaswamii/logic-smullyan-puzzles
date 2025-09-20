; 122.
; On an island of knights and knaves you ask native A: "There is gold on this island iff I am a knight."
; Two parts:
; (a) Can it be determined whether A is a knight or knave?
; (b) Can it be determined whether there is gold on the island?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const Gold Bool)

; A's statement: "There is gold iff I am a knight" (biconditional)
(define-fun stmtA () Bool (= Gold (= A Knight))) 

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)
