; 119.
; Three girls: Sue, Marcia, Dianne. Given:
; (1) I love at least one of the three girls.
; (2) If I love Sue but not Dianne, then I also love Marcia.
; (3) I either love both Dianne and Marcia or I love neither one.
; (4) If I love Dianne, then I also love Sue.
; Which girls do I love?

(declare-const LoveSue Bool)
(declare-const LoveMarcia Bool)
(declare-const LoveDianne Bool)

(assert (or LoveSue LoveMarcia LoveDianne))
(assert (=> (and LoveSue (not LoveDianne)) LoveMarcia))
(assert (or (and LoveDianne LoveMarcia) (and (not LoveDianne) (not LoveMarcia))))
(assert (=> LoveDianne LoveSue))

(check-sat)
(get-model)
