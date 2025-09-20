; 120.
; Suppose it is given that I am either a knight or a knave.
; I make the following two statements:
; (1) I love Linda.
; (2) If I love Linda then I love Kathy.
; Am I a knight or a knave?

(declare-datatypes () ((Role Knight Knave Normal)))
(declare-const Me Role)
(declare-const LoveLinda Bool)
(declare-const LoveKathy Bool)

; Restrict me to be Knight or Knave
(assert (not (= Me Normal)))

(assert (=> (= Me Knight) LoveLinda))
(assert (=> (= Me Knave) (not LoveLinda)))

; Second statement: If I love Linda then I love Kathy.
(define-fun stmt2 () Bool (=> LoveLinda LoveKathy))
(assert (=> (= Me Knight) stmt2))
(assert (=> (= Me Knave) (not stmt2)))

(check-sat)
(get-model)
