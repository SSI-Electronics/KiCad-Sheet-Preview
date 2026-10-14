# Development instrumentation audit — KiCad 10.0.6

**Review date:** 15 October 2026  
**Source:** `SSI_KiCad_10.0.6_CLEAN_15_FILES.patch` from `SSI_KiCad_10.0.6_Upstream_Comparison_001.zip`.  
**Scope:** static source review; no execution, rebuild, or change to installed binaries.

## Explicit CSV writes in the 15-file patch

| Source file | Destination | Purpose indicated by code |
| --- | --- | --- |
| `common/gal/cairo/cairo_gal.cpp` | `C:/Downloads/SSI_DEV023A4B_Cairo_Groups.csv` | Cairo GAL construction, group-build and group-draw counts |
| `common/view/view.cpp` | `C:/Downloads/SSI_DEV023A9_View_Identity.csv` | View identity / sheet-cache instrumentation |
| `common/view/view.cpp` | `C:/Downloads/SSI_DEV023A3_View_Timings.csv` | View timing measurements |
| `eeschema/sch_painter.cpp` | `C:/Downloads/SSI_DEV023A2_Cairo_Timings.csv` | Child-preview painting timing measurements |
| `include/view/view.h` | `C:/Downloads/SSI_DEV023A10_Target_Setters.csv` | Sheet target mutation tracing |

The source contains eight references to these five explicit CSV paths. The existence of the logging code is confirmed; whether each branch executes during ordinary use, and exactly which fields are emitted, requires further targeted review and/or runtime tests. The hard-coded absolute path may be unsuitable on other Windows systems.

## Release significance

- These diagnostics are distinct from the user-facing read-only sheet-preview feature.
- They should be reviewed for privacy, filesystem side effects, error handling and performance.
- **Do not simply delete these lines and claim that the resulting source corresponds to the already shipped v1.0.2 candidate.**
- If a production-clean version is desired, remove or gate instrumentation in a **new source revision**, build and test **new binaries**, then update the release provenance. Keep the tested v1.0.2 intact.
- GPL corresponding-source obligations apply to the actual distributed binaries; a sanitized patch that omits code compiled into those binaries is not an accurate substitute.

## Current decision

**Public binary release: HOLD.** No modifications have been made to the existing binaries, installer, or original source archives. This document identifies a review requirement; it is not evidence of malicious behavior or actual exposure of user data.
