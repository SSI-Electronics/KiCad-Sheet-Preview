# v1.0.2 — Windows x64 (release notes)

**SSI KiCad Sheet Preview** — independent modification for **KiCad 10.0.6 Windows x64**. Not an official KiCad release.

## Features
- Automatic scaled, clipped child-schematic previews inside hierarchical sheet rectangles.
- Previews are non-editable; sheet navigation remains clickable.
- Hierarchical sheet geometry can be viewed and adjusted on the root schematic page.
- PDF and SVG plotting support; previews refresh after child-sheet edits.

## Patcher
- Separate GUI patcher for an existing KiCad 10.0.6 x64 installation; it does not install KiCad.
- Installation validation, original-file backups, restore/rollback, progress reporting.
- Last selected installation folder remembered locally.
- Unsigned executable: verify checksums and respect operating-system security warnings.

## Files to attach
- `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2_Win64.zip` — SHA-256 `c95eecdf41820d6475329249a69765629e85e3f18b45f539dfdfd1c30e858df4`
- `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2_Source.zip` — SHA-256 `319e507ea07759cd17756470f209df66e5ac7af4e1213af3f99e48c720a31fc6`

The 15-file modified KiCad patch is published at [source/patches](../source/patches/SSI_KiCad_10.0.6_CLEAN_15_FILES.patch).

## Requirements and precautions
Close KiCad before patching; select only an **original KiCad 10.0.6 Windows x64** installation that passes validation. Retain patcher-managed backups until successful restoration. Do not bypass security protections to run the unsigned EXE.

## Licensing and source distribution — outstanding
**Do not describe this release as GPL-complete yet.** The patcher source ZIP and 15-file KiCad patch are **not by themselves complete Corresponding Source** for all included KiCad binaries and dependencies. Before publicly attaching the binary ZIP, supply the full applicable Corresponding Source, necessary build/install scripts and third-party license notices, or an appropriate GPLv3-compliant distribution arrangement. The historic v1.0.2 binaries contain documented development instrumentation and an obsolete embedded README. The tested binary has not been altered.

## Publishing steps
1. On GitHub open **Releases → Draft a new release**.
2. Set tag `v1.0.2`, title `SSI KiCad Sheet Preview v1.0.2 — Windows x64`.
3. Paste these notes, attach the two ZIPs and publish checksums.
4. **Publish the binary release only after the licensing/source condition above has been satisfied.**

This document is a release draft, not evidence that a GitHub Release has been created.
