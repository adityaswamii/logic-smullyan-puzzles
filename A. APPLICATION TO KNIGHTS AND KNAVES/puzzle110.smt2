; 110.
; Someone asks A, "Are you a knight?" He replies, "If I'm a knight, then I'll eat my hat!"
; Prove that A has to eat his hat.

(declare-datatypes () ((Role Knight Knave)))
(declare-const A Role)
(declare-const EatHat Bool)

; Statement by A: If I'm a knight then I'll eat my hat.
(define-fun stmtA () Bool (=> (= A Knight) EatHat))

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(check-sat)
(get-model)

; Note: To *show* EatHat is logically forced, run:
; - If this check is sat & model has EatHat = true then it holds in the model.
; - To prove EatHat must be true in all models, add (assert (not EatHat)) and check for unsat.

