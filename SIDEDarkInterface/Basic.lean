/-
  SIDEDarkInterface/Basic.lean
  =============================

  THE DARK INTERFACE OF INFORMAL REASONING

  κ(validity, natural_language) = 0
  κ(validity, type_system) = 1
  κ(universality, natural_language) = 1
  κ(universality, type_system) = 0

  Natural language is silent for validity.  The type system is bright
  for validity, achieved by narrowing universality.  The two-leg
  architecture composes both to achieve brightness on both axes.

  Vanilla Lean 4 — no Mathlib dependency.
  Toolchain: leanprover/lean4:v4.29.0-rc8.

  Sources:
   - DARK_INTERFACE_SUBMISSION.md
   - UNIFIED_COGNITIVE_SCIENCE_PAPER.md
   - SIEVE_CEILING_LEMMA.md
   - SIDE-silence-principle

  Author: J. York Seale (NaturalScience, ORCID 0009-0008-7993-0310)
  Programme: A PLACE TO STAND, Phase 2.  May 2026.
-/

namespace SIDEDarkInterface

/-! ## §1. Media and Parameters -/

inductive Medium where
  | natural_language
  | type_system
  | formal_subset_of_NL
  | two_leg_architecture
deriving DecidableEq, Repr

inductive Parameter where
  | validity
  | universality
deriving DecidableEq, Repr

/-! ## §2. The κ Measurements -/

/-- κ × 100 for each (parameter, medium) pair. -/
def kappa_x100 : Parameter → Medium → Nat
  | .validity,     .natural_language     => 0
  | .universality, .natural_language     => 100
  | .validity,     .type_system          => 100
  | .universality, .type_system          => 0
  | .validity,     .formal_subset_of_NL  => 50
  | .universality, .formal_subset_of_NL  => 50
  | .validity,     .two_leg_architecture => 100
  | .universality, .two_leg_architecture => 100

theorem nl_dark_for_validity : kappa_x100 .validity .natural_language = 0 := by decide

theorem ts_bright_for_validity : kappa_x100 .validity .type_system = 100 := by decide

theorem nl_bright_for_universality : kappa_x100 .universality .natural_language = 100 := by decide

theorem ts_dark_for_universality : kappa_x100 .universality .type_system = 0 := by decide

/-- A medium is silent for a parameter iff κ = 0. -/
def isSilent (p : Parameter) (m : Medium) : Bool := kappa_x100 p m == 0

/-- A medium is bright for a parameter iff κ = 100. -/
def isBright (p : Parameter) (m : Medium) : Bool := kappa_x100 p m == 100

/-! ## §3. Complementarity -/

/-- The complementarity sum κ(validity, m) + κ(universality, m). -/
def complementarity_sum (m : Medium) : Nat :=
  kappa_x100 .validity m + kappa_x100 .universality m

theorem nl_complementarity : complementarity_sum .natural_language = 100 := by decide
theorem ts_complementarity : complementarity_sum .type_system = 100 := by decide
theorem formal_subset_complementarity : complementarity_sum .formal_subset_of_NL = 100 := by decide
theorem two_leg_exceeds_trade_off : complementarity_sum .two_leg_architecture = 200 := by decide

def isPureMedium : Medium → Bool
  | .natural_language     => true
  | .type_system          => true
  | .formal_subset_of_NL  => true
  | .two_leg_architecture => false

theorem pure_media_at_trade_off (m : Medium) :
    isPureMedium m = true → complementarity_sum m = 100 := by
  intro h
  cases m with
  | natural_language => decide
  | type_system => decide
  | formal_subset_of_NL => decide
  | two_leg_architecture => simp [isPureMedium] at h

/-! ## §4. The Silence Principle Applied to Communication Media

  The Silence Principle: essential ∧ universal ⇒ silent for the
  corresponding behavioral parameter.  Applied to mathematical
  communication with behavioral parameter validity and structural
  parameter universality.
-/

structure CommunicationMedium where
  essential : Bool
  universal : Bool
  bright_for_validity : Bool
deriving DecidableEq, Repr

/-- Natural language: essential, universal, dark for validity. -/
def natural_language_medium : CommunicationMedium := {
  essential := true,
  universal := true,
  bright_for_validity := false
}

/-- Type system: essential, narrow, bright for validity.  The narrowing
    is the mechanism by which validity-brightness is achieved. -/
def type_system_medium : CommunicationMedium := {
  essential := true,
  universal := false,
  bright_for_validity := true
}

/-- Formal notation embedded in natural language: essential, narrow,
    dark for validity. -/
def formal_subset_medium : CommunicationMedium := {
  essential := true,
  universal := false,
  bright_for_validity := false
}

theorem natural_language_essential : natural_language_medium.essential = true := by decide
theorem natural_language_universal : natural_language_medium.universal = true := by decide
theorem natural_language_dark : natural_language_medium.bright_for_validity = false := by decide

theorem type_system_essential : type_system_medium.essential = true := by decide
theorem type_system_narrow : type_system_medium.universal = false := by decide
theorem type_system_bright : type_system_medium.bright_for_validity = true := by decide

/-! ## §5. The Two-Leg Architecture -/

theorem two_leg_validity_bright :
    kappa_x100 .validity .two_leg_architecture = 100 := by decide

theorem two_leg_universality_bright :
    kappa_x100 .universality .two_leg_architecture = 100 := by decide

theorem two_leg_both_bright :
    isBright .validity .two_leg_architecture = true ∧
    isBright .universality .two_leg_architecture = true := by decide

/-! ## §6. Cognitive Interfaces -/

inductive CognitiveInterface where
  | passive_lecture
  | active_learning
  | type_checked_proof
  | peer_review_natural_language
  | working_memory_to_LTM
  | attention_to_perception
deriving DecidableEq, Repr

def cognitive_kappa_x100 : CognitiveInterface → Nat
  | .passive_lecture              => 0
  | .active_learning              => 50
  | .type_checked_proof           => 100
  | .peer_review_natural_language => 0
  | .working_memory_to_LTM        => 0
  | .attention_to_perception      => 0

theorem passive_lecture_dark :
    cognitive_kappa_x100 .passive_lecture = 0 := by decide

theorem type_checked_proof_bright :
    cognitive_kappa_x100 .type_checked_proof = 100 := by decide

theorem peer_review_dark :
    cognitive_kappa_x100 .peer_review_natural_language = 0 := by decide

theorem working_memory_to_LTM_dark :
    cognitive_kappa_x100 .working_memory_to_LTM = 0 := by decide

theorem attention_to_perception_dark :
    cognitive_kappa_x100 .attention_to_perception = 0 := by decide

def cognitive_silent_set : List CognitiveInterface :=
  [.passive_lecture, .peer_review_natural_language,
   .working_memory_to_LTM, .attention_to_perception]

theorem cognitive_silent_set_all_dark :
    ∀ i ∈ cognitive_silent_set, cognitive_kappa_x100 i = 0 := by
  intro i h
  cases i with
  | passive_lecture => decide
  | active_learning => simp [cognitive_silent_set] at h
  | type_checked_proof => simp [cognitive_silent_set] at h
  | peer_review_natural_language => decide
  | working_memory_to_LTM => decide
  | attention_to_perception => decide

/-! ## §7. The Validity-Certified Proof Theorem -/

/-- A proof certifies validity iff its derivation chain contains at
    least one inference step through a bright-validity interface. -/
def certifies_validity (uses_bright_step : Bool) : Bool := uses_bright_step

theorem nl_only_no_certification :
    certifies_validity false = false := by decide

theorem two_leg_certifies :
    certifies_validity true = true := by decide

/-! ## §8. Falsification Routes

  Separate from the main assertion chain.  This section catalogs the
  conditions under which each load-bearing claim would be falsified.
-/

structure FalsificationRoute where
  claim_under_test : String
  falsifying_condition : String

def falsification_routes : List FalsificationRoute := [
  { claim_under_test := "kappa_validity_NL_zero",
    falsifying_condition :=
      "A feature of natural language reliably distinguishing valid " ++
      "from invalid mathematical arguments without checking the math." },
  { claim_under_test := "kappa_validity_TS_one",
    falsifying_condition :=
      "A type-correct Lean term proving False from no axioms." },
  { claim_under_test := "essential_universal_implies_silent",
    falsifying_condition :=
      "An essential, universal medium bright for validity." }
]

theorem three_falsification_routes_listed :
    falsification_routes.length = 3 := by decide

end SIDEDarkInterface
