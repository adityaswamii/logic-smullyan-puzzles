; 114.
; Two individuals, X and Y, were being tried for participation in a robbery.
; A and B were court witnesses, each A,B is either a knight or a knave.
; A: If X is guilty, so is Y.
; B: Either X is innocent or Y is guilty.
; Are A and B necessarily of the same type?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const B Role)
(declare-const GuiltyX Bool)
(declare-const GuiltyY Bool)

(define-fun stmtA () Bool (=> GuiltyX GuiltyY))
(define-fun stmtB () Bool (or (not GuiltyX) GuiltyY))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(assert (=> (= B Knight) stmtB))
(assert (=> (= B Knave) (not stmtB)))

(check-sat)
(get-model)

; try adding (assert (not (= A B))) and check if unsat (meaning they must be same).
