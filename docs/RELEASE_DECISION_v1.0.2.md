# Release decision — v1.0.2 (15 October 2026)

## What is verified

- The tested Windows patcher asset `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2_Win64.zip` has SHA-256 `c95eecdf41820d6475329249a69765629e85e3f18b45f539dfdfd1c30e858df4` and ZIP CRC PASS.
- The full modified-source bundle `SSI_KiCad_Sheet_Preview_v1.0.2_Source_Licenses_002.zip` has SHA-256 `6b4a4cbd5d51345d115353f23f0445d0795a2540aa2c64b6bdae31651e284b9a` and ZIP CRC PASS.
- The original KiCad modified source tree, original SSI Go patcher source, GPL license text, patch, and partial build evidence are preserved.
- SSI Electronics explicitly authorized GPL-3.0-or-later for its own code.
- The KiCad source manifest pins Microsoft vcpkg baseline `01e159b519b7e791cc5bb3548663a26d9c0922a3` and KiCad custom vcpkg baseline `9b23c206291914d106d4e9ca486453f676c9b561`.

## What is NOT verified

The package currently lacks demonstrated equivalent-access delivery of the exact applicable third-party source and a complete verified compilation/installation-control recipe for all redistributed KiCad binary components. Registry commits and package version inventories identify upstream locations but do not themselves deliver the actual source used for the linked components. Not every vcpkg package is necessarily required; System Libraries and unmodified general-purpose build tools are excluded as provided by GPLv3 section 1.

## Release disposition

**Source-only publication is possible without the binary ZIP, subject to preserving the included per-file third-party notices.** For a binary release, first ensure the complete Corresponding Source is offered via a GPLv3 section 6 compliant route. Merely uploading the current full KiCad source ZIP plus links to registry baselines does not prove that requirement.

**Do not mark the existing draft binary release as GPL-complete or publish it on the strength of this review.** A source-only public release may be made by removing the Windows binary ZIP from its assets, updating the title and description to indicate source-only, and publishing the source bundle; keep the tested Windows binary for a subsequent release once the source-delivery gap is resolved.

This is a factual release readiness record, not legal advice. No binaries were modified.
