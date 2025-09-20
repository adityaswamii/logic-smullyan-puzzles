; 111.
; A says, "If I'm a knight, then two plus two equals four." Is A a knight or a knave?

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)

; Statement: If I'm a knight then 2+2=4 
(define-fun stmtA () Bool (=> (= A Knight) (= (+ 2 2) 4)))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)

