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

## Files for the release
- `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2_Win64.zip` — tested patcher; SHA-256 `c95eecdf41820d6475329249a69765629e85e3f18b45f539dfdfd1c30e858df4`
- `SSI_KiCad_Sheet_Preview_v1.0.2_Source_Licenses_002.zip` — preserved modified KiCad source tree, SSI patcher source, licenses and build evidence; SHA-256 `6b4a4cbd5d51345d115353f23f0445d0795a2540aa2c64b6bdae31651e284b9a`
- `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2_Source.zip` — optional standalone Go patcher source; SHA-256 `319e507ea07759cd17756470f209df66e5ac7af4e1213af3f99e48c720a31fc6`

The 15-file modified KiCad patch is published at [source/patches](../source/patches/SSI_KiCad_10.0.6_CLEAN_15_FILES.patch).

## Requirements and precautions
Close KiCad before patching; select only an **original KiCad 10.0.6 Windows x64** installation that passes validation. Retain patcher-managed backups until successful restoration. Do not bypass security protections to run the unsigned EXE.

## Licensing and source distribution — outstanding
SSI's original Go patcher code and KiCad modifications are GPL-3.0-or-later, with owner approval; see [LICENSING.md](LICENSING.md). The version 002 source ZIP is the retained **full modified KiCad source tree**, rather than the earlier patch-only addendum. It also contains available build evidence and license texts. External dependency source and complete build-control coverage have not been independently confirmed.

**Do not describe this release as GPL-complete yet.** The patcher source ZIP and 15-file KiCad patch are **not by themselves complete Corresponding Source** for all included KiCad binaries and dependencies. Before publicly attaching the binary ZIP, supply the full applicable Corresponding Source, necessary build/install scripts and third-party license notices, or an appropriate GPLv3-compliant distribution arrangement. The historic v1.0.2 binaries contain documented development instrumentation and an obsolete embedded README. The tested binary has not been altered.

## Publishing steps
1. On GitHub open **Releases → Draft a new release**.
2. Set tag `v1.0.2`, title `SSI KiCad Sheet Preview v1.0.2 — Windows x64`.
3. Attach the tested Windows ZIP and the version 002 full source ZIP; optionally attach the standalone Go source ZIP. Keep the two mandatory SHA-256 values visible.
4. **Publish the binary release only once the remaining corresponding-source and build-control requirements have been verified or supplied through a compliant equivalent-access source route.**

This document is a release draft, not evidence that a GitHub Release has been created.
