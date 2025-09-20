; 123.
; Same setting as 122. If A had been asked "Is being a knight equivalent to there being gold?"
; and had answered "No", could you tell whether there is gold?

(declare-datatypes () ((Role Knight Knave Normal)))
(declare-const A Role)
(declare-const Gold Bool)

(assert (not (= A Normal)))

(define-fun P () Bool (= Gold (= A Knight)))

(define-fun stmtA () Bool (not P))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)

