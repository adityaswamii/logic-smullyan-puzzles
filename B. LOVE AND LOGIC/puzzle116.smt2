; 116.
; Suppose the following two statements are true:
; (1) I love Betty or I love Jane.
; (2) If I love Betty then I love Jane.
; Does it necessarily follow that I love Betty? Does it necessarily follow that I love Jane?

(declare-const LoveBetty Bool)
(declare-const LoveJane Bool)

(assert (or LoveBetty LoveJane))
(assert (=> LoveBetty LoveJane))

(check-sat)
(get-model)

; To check necessity:
; - To test "necessarily LoveBetty": add (assert (not LoveBetty)) and check for unsat.
; - To test "necessarily LoveJane": add (assert (not LoveJane)) and check for unsat.
