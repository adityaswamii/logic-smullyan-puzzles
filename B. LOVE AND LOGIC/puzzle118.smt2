; 118.
; Given Eva and Margaret.
; Someone asks: "Is it true that if you love Eva then you also love Margaret?"
; I reply: "If it is true, then I love Eva, and if I love Eva, then it is true."
; Which girl do I necessarily love?

(declare-const LoveEva Bool)
(declare-const LoveMargaret Bool)

(define-fun P () Bool (=> LoveEva LoveMargaret))
(define-fun reply () Bool (and (=> P LoveEva) (=> LoveEva P)))

(assert reply)

(check-sat)
(get-model)

; To see which love-variables are forced, add assertions (not LoveEva) or (not LoveMargaret) and check unsat.
