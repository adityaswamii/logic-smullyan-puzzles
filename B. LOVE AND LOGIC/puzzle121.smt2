; 121. A watched kettle never boils unless it is watched
; According to the book, this is equivalent to:
; "If the kettle boils, then it is watched."

(declare-const Boils Bool)    ; True if kettle boils
(declare-const Watched Bool)  ; True if kettle is being watched

; Encode the statement: "If the kettle boils, then it is watched"
(assert (=> Boils Watched))

(check-sat)
(get-model)


(assert (not (and (= Boils false) (= Watched false))))
(check-sat)
(get-model)

(assert (not (and (= Boils false) (= Watched true))))
(check-sat)
(get-model)

(assert (not (and (= Boils true) (= Watched true))))
(check-sat)
(get-model)


