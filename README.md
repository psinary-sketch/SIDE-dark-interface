# SIDE-dark-interface v0.2

SIDE-dark-interface compiles lookups in a table entered by hand. Statements at f4a1ea6:

    theorem nl_dark_for_validity : kappa_x100 .validity .natural_language = 0 (SIDEDarkInterface/Basic.lean :58)

The entries of kappa_x100 are inputs: the kernel checks what follows from the table and measures nothing.

```
κ(validity, natural_language)     = 0
κ(validity, type_system)          = 1
κ(universality, natural_language) = 1
κ(universality, type_system)      = 0
```

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
Four media: `natural_language`, `type_system`, `formal_subset_of_NL`, `two_leg_architecture`. Two parameters: `validity`, `universality`.

### §5 — Two-leg architecture
`two_leg_both_bright`: bright on both axes.

### §6 — Cognitive interfaces
The silent set theorem `cognitive_silent_set_all_dark`.

### §8 — Falsification routes
Three falsification routes catalogued in their own section.

## Build

```bash
lake build
```

Self-contained — no Mathlib.

## Federation context

| Kernel | Role |
|---|---|
| SIDE-silence-principle | Essential ∧ universal ⇒ silent (the engine) |
| SIDE-compression | Chain length = N requires a bright-validity step |
| SIDE-kernel | Sieve Ceiling Lemma uses the validity-certified proof theorem |

## License

CC-BY 4.0.

> Seale, J. Y. (2026). *SIDE-dark-interface v0.2: Natural Language as a Spectrally Silent Medium for Logical Validity.* A PLACE TO STAND Research Programme.

---

`:: → · ← ::`

