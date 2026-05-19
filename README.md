# SIDE-dark-interface v0.2

Kernel verification of the κ-measurements for mathematical communication and cognitive interfaces.

```
κ(validity, natural_language)     = 0
κ(validity, type_system)          = 1
κ(universality, natural_language) = 1
κ(universality, type_system)      = 0
```

Natural language is silent for validity. The type system is bright for validity, achieved by narrowing universality. The two-leg architecture composes both legs to achieve brightness on both axes.

## Status

| | |
|---|---|
| Toolchain | `leanprover/lean4:v4.29.0-rc8` |
| Mathlib | not required |
| sorry | 0 |
| axioms | 0 |

Companion paper: `DARK_INTERFACE_SUBMISSION.md`. Related: `UNIFIED_COGNITIVE_SCIENCE_PAPER.md`, `SIEVE_CEILING_LEMMA.md`.

## What's verified

### §1–§2 — Media and κ measurements
Four media: `natural_language`, `type_system`, `formal_subset_of_NL`, `two_leg_architecture`. Two parameters: `validity`, `universality`. Direct κ measurements: `nl_dark_for_validity`, `ts_bright_for_validity`, `nl_bright_for_universality`, `ts_dark_for_universality`.

### §3 — Complementarity
Pure media saturate the trade-off at validity + universality = 100 (`pure_media_at_trade_off`). The two-leg architecture sums to 200 (`two_leg_exceeds_trade_off`) by composing two complementary legs.

### §4 — The Silence Principle applied to communication media
Natural language: essential, universal, dark for validity. Type system: essential, narrow, bright for validity (narrowing is the mechanism of validity-brightness). Formal notation embedded in natural language: essential, narrow, dark for validity.

### §5 — Two-leg architecture
`two_leg_validity_bright`: validity via type-system leg. `two_leg_universality_bright`: universality via natural-language leg. `two_leg_both_bright`: bright on both axes.

### §6 — Cognitive interfaces
Six cognitive interfaces with their κ values: passive lecture (0), active learning (50), type-checked proof (100), peer review through natural language alone (0), working memory to long-term memory (0), attention to perception (0). The silent set theorem `cognitive_silent_set_all_dark`.

### §7 — Validity-certified proof
A proof certifies validity iff it contains at least one inference step through a bright-validity interface. `nl_only_no_certification`, `two_leg_certifies`.

### §8 — Falsification routes
Three falsification routes catalogued in their own section. Each names the specific structural condition that would falsify a corresponding load-bearing claim.

## Build

```bash
lake build
```

Self-contained — no Mathlib.

## Federation context

| Kernel | Role |
|---|---|
| SIDE-silence-principle | Essential ∧ universal ⇒ silent (the engine) |
| **SIDE-dark-interface** | **The engine applied to communication and cognitive interfaces** |
| SIDE-compression | Chain length = N requires a bright-validity step |
| SIDE-kernel | Sieve Ceiling Lemma uses the validity-certified proof theorem |

## License

CC-BY 4.0.

> Seale, J. Y. (2026). *SIDE-dark-interface v0.2: Natural Language as a Spectrally Silent Medium for Logical Validity.* A PLACE TO STAND Research Programme.

---

`:: → · ← ::`

*Natural language transmits the form of reasoning. Type systems transmit correctness by narrowing form.*
