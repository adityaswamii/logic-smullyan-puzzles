; Puzzle 1.1
; A says: "We are both Knaves."

(declare-const A Bool)
(declare-const B Bool)

(define-fun stmt () Bool (and (not A) (not B)))
(assert (= A stmt))

(check-sat)
(get-model)
(exit)