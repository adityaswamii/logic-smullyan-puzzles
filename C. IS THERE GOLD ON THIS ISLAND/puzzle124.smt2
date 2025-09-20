; 124. "How I Became Rich."
; Three islands A,B,C. Known: there is gold on at least one island.
; Islands B and C uninhabited. Island A inhabited by Knight/Knave and possibly Normals (unknown).
; The decoded map sentences:
; (1) THERE IS NO GOLD ON ISLAND A.  i.e., (not GoldA)
; (2) IF THERE ARE ANY NORMALS ON ISLAND A, THEN THERE IS GOLD ON TWO OF THE ISLANDS.
;
; You may ask one question of a randomly chosen native (unknown role). Goal is to pick a question that after reply
; allows you to point to an island that definitely has gold.

(declare-datatypes () ((Role Knight Knave Normal)))
(declare-const Native Role) ; the person you may question (their role unknown)
(declare-const GoldA Bool)
(declare-const GoldB Bool)
(declare-const GoldC Bool)
(declare-const ExistsNormalA Bool) ; whether there exists any normal on island A

; Given facts:
(assert (not GoldA)) ; sentence (1)
; (2): If there are any normals on A then gold on exactly two islands
(define-fun exactly_two_gold () Bool
  (or
    (and GoldA GoldB (not GoldC))
    (and GoldA GoldC (not GoldB))
    (and GoldB GoldC (not GoldA))
  )
)
(assert (=> ExistsNormalA exactly_two_gold))


(check-sat)
(get-model)
