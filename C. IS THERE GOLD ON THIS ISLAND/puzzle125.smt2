; 125.
; Different island with knights, knaves, and normals. It is rumored there is gold on the island.
; King (a knight) introduces three natives A,B,C and says at most one is normal.
; You are allowed two yes/no questions to whichever ones you wish.
; Question: Is there a way in two questions to find out whether there is gold?
;
; Here we encode the setting and constraint "at most one normal".
; Designing the two-question strategy requires interaction beyond a single-model check.

(declare-datatypes () ((Role Knight Knave Normal)))
(declare-const A Role)
(declare-const B Role)
(declare-const C Role)
(declare-const Gold Bool)

; At most one normal among A,B,C
(define-fun isNormalCountOK () Bool
  (let ((nA (= A Normal)) (nB (= B Normal)) (nC (= C Normal)))
    (<= (+ (ite nA 1 0) (ite nB 1 0) (ite nC 1 0)) 1)
  )
)
(assert isNormalCountOK)

(check-sat)
(get-model)

