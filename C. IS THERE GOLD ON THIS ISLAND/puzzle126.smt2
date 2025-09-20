; 126. An Inferential Puzzle.
; Two neighboring islands each inhabited by knights and knaves only.
; On one island an even number of knights, on the other an odd number of knights.
; Gold is on the island containing an even number of knights.
; You visit one island and interview three inhabitants A,B,C; you are the only visitor.
; They say:
; A: There is an even number of knaves on this island.
; B: Right now, there is an odd number of people on the island.
; C: I am a knight iff A and B are of the same type.
; Assuming you are neither knight nor knave and you are the only visitor, is there gold on the island?

; We'll formalize quantities modulo parity and the statements; this is a modeling-level encoding.

; We model the three interviewees roles (Knight/Knave), number of inhabitants parity parameters, and the gold rule.

(declare-datatypes () ((Role Knight Knave Normal)))
(declare-const A Role)
(declare-const B Role)
(declare-const C Role)
; Only knights and knaves on this island
(assert (not (= A Normal)))
(assert (not (= B Normal)))
(assert (not (= C Normal)))

; Let NumPeople be odd/even; since you are the only visitor (so not counted as islander),
; B says "there is an odd number of people on the island right now" — interpret as current total inhabitants (parity).
(declare-const NumPeopleOdd Bool) ; true = odd, false = even

; Let NumKnavesOdd Bool represent parity of number of knaves.
(declare-const NumKnavesOdd Bool)

; A's statement: "There is an even number of knaves on this island."
(define-fun stmtA () Bool (not NumKnavesOdd))

; B's statement: "Right now, there is an odd number of people on the island."
(define-fun stmtB () Bool NumPeopleOdd)

; C's statement: "I am a knight iff A and B are of the same type."
(define-fun sameAB () Bool (= A B)) ; true if same constructor
(define-fun stmtC () Bool (= (= C Knight) sameAB)) ; C is Knight iff sameAB

(assert (=> (= A Knight) stmtA))
(assert (=> (= A Knave) (not stmtA)))

(assert (=> (= B Knight) stmtB))
(assert (=> (= B Knave) (not stmtB)))

(assert (=> (= C Knight) stmtC))
(assert (=> (= C Knave) (not stmtC)))

; Gold is on island iff number of knights is even (given earlier: gold on island with even knights)
; Count parity relation: number of knights parity = not NumKnavesOdd if total parity known.
; Without full population size we cannot fully compute, but we provide the premises for exploration.

(check-sat)
(get-model)

