; 115.
; A, B, C are knights or knaves.
; A: B is a knight.
; B: If A is a knight, so is C.
; Can it be determined what any of A,B,C are?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const B Role)
(declare-const C Role)

(define-fun stmtA () Bool (= B Knight))
(define-fun stmtB () Bool (=> (= A Knight) (= C Knight)))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(assert (=> (= B Knight) stmtB))
(assert (=> (= B Knave) (not stmtB)))

(check-sat)
(get-model)

