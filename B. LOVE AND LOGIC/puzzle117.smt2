; 117.
; Someone asks: "Is it true that if you love Betty then you also love Jane?"
; I reply: "If it is true, then I love Betty."
; Does it follow that I love Betty? that I love Jane?
;
; Formalize: Let P = (=> LoveBetty LoveJane). The reply is (=> P LoveBetty).

(declare-const LoveBetty Bool)
(declare-const LoveJane Bool)

(define-fun P () Bool (=> LoveBetty LoveJane))
(define-fun reply () Bool (=> P LoveBetty))

(assert reply)
;(assert LoveJane)

(check-sat)
(get-model)

; To test consequences, assert (not LoveBetty) or (not LoveJane) and check for unsat.
