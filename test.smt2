; A says: "We are both Knaves."

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const B Role)

(define-fun stmt () Bool (and (= A Knave) (= B Knave)))

(assert (=> (= A Knight) stmt))
(assert (=> (= A Knave) (not stmt)))

(check-sat)
(get-model)