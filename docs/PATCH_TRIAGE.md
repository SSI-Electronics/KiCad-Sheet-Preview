# Patch path triage — KiCad 10.0.6

**Status:** completed classification of the retained patch; upstream baseline comparison still pending.

The retained file `SSI_KiCad_10.0.6_Source_Changes_001.patch` contains **41 file patches and 70 hunks**.

## Group A: 15 core implementation paths

These paths contain substantive additions or modifications related to rendering, plotting, sheet geometry, or development diagnostics:

- `common/gal/cairo/cairo_gal.cpp`
- `common/gal/opengl/vertex_manager.cpp`
- `common/plotters/PDF_plotter.cpp`
- `common/plotters/SVG_plotter.cpp`
- `common/view/view.cpp`
- `eeschema/dialogs/dialog_sheet_properties.cpp`
- `eeschema/dialogs/dialog_sheet_properties.h`
- `eeschema/sch_painter.cpp`
- `eeschema/sch_painter.h`
- `eeschema/sch_sheet.cpp`
- `eeschema/sch_sheet.h`
- `eeschema/sch_view.cpp`
- `include/plotters/plotter.h`
- `include/plotters/plotters_pslike.h`
- `include/view/view.h`

## Group B: 26 generated-looking help/formula headers

Three paths are under `eeschema/`, ten under `pcb_calculator/`, and thirteen under `pcbnew/`. All 26 have **exactly equal added and deleted line counts** in the patch. This is consistent with a broad reformatting or regeneration, but does **not** by itself prove that the content is semantically unchanged.

These files are **not yet excluded** from the source patch. Excluding them without comparing to pristine upstream would risk misrepresenting the actual build inputs.

## Audit limitations

The environment in which this audit runs has no direct network access to the official KiCad GitLab source tree, and no verified pristine 10.0.6 source archive was present among the retained local artifacts. The current modified source archive lacks `.git` metadata. Therefore **no honest upstream diff can be certified yet**.

## Required next input

Provide a pristine official KiCad **10.0.6** source archive (from the KiCad project's official release/tag), with the original filename and source URL retained. It should be treated as a read-only reference. We will:

1. Verify its version and provenance.
2. Compare the 41 modified paths against that exact upstream baseline.
3. Separate feature changes from diagnostics and generated-file differences.
4. Produce a minimal patch and a separate full corresponding-source package without changing the tested v1.0.2 binaries.
5. Check whether the resulting source and build recipe can account for the exact shipped payload.

**Release decision remains HOLD** until source correspondence and GPL distribution requirements are satisfied.


## Upstream comparison completed — 15 October 2026

The user supplied `kicad-10.0.6.zip` (19,672 ZIP entries, uncompressed size 1,119,773,259 bytes, SHA-256 `3adc6a666443bd5cfe0b753b35ca5bb7c9b42f1ee8928f56e5dcf2fb16eb8c0e`). This is the pristine *candidate* baseline; its external origin/tag signature has not been independently authenticated.

All 41 paths in the retained modification patch were found in both this archive and the retained modified source archive. Bytewise comparison yielded 41 differences; after normalizing CRLF to LF:

- **15 paths retain substantive content differences** (the previously identified core paths).
- **26 paths are exactly identical after newline normalization** (the previously identified help/formula headers).
- **0 paths are missing**.

A new, normalized unified patch containing only the 15 substantive paths was generated and successfully checked with `git apply --check` against the extracted original versions of all 15 files. The audit package `SSI_KiCad_10.0.6_Upstream_Comparison_001.zip` contains that patch, a 41-row SHA-256 comparison CSV, and a README. Its SHA-256 is `ba474641366fd6343fb35233953859e6856cd1653355c98f54b427c62a2e0eb5`.

**Resolved:** The 26 apparent help/formula changes are newline-only. **Still open:** authenticate pristine archive origin, validate full build recipe/source correspondence, and complete GPL distribution review. No shipped executable or installed binary was modified.
