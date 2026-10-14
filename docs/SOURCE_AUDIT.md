# Source and licensing audit — 15 October 2026

**Status: NOT YET CLEARED FOR BINARY RELEASE.**

This is a technical source-distribution audit, not a legal opinion.

## Verified

- KiCad's official licensing page states that most KiCad code is GPL-3.0-or-later, with additional licenses in the source tree.
- The local source archive `SSI_KiCad_10.0.6_Release_1.0_SOURCE.zip` contains `LICENSE.README` and `LICENSE.GPLv3`.
- `SSI_KiCad_10.0.6_Source_Changes_001.patch` covers **41 paths**, all present in the source archive.
- `git apply --reverse --check` **PASS** for all 41 files against the source archive: the patch corresponds to the supplied modified file versions.
- Windows release ZIP and patcher source ZIP SHA-256 hashes match the published `RELEASE_SHA256SUMS.txt`.
- The patcher source ZIP contains `main.go` and `go.mod`.

## Not yet verified / blockers

1. **Original source provenance:** the archive contains a modified KiCad source tree. The exact upstream KiCad 10.0.6 tag and pristine base tree still need a verified comparison, so the modification patch has not been proved to apply to a clean upstream release.
2. **Binary-to-source provenance:** no reproducible build or build manifest proves that the 27 shipped binaries were generated from this exact source tree, with the same toolchain and dependencies.
3. **Complete patcher build:** the Go source refers to an appended/embedded ZIP payload, but the source archive does not include the packaging procedure and payload inputs necessary to reproduce the standalone EXE.
4. **Third-party licensing:** the source archive contains third-party and build-related material; preserve upstream notices and review redistribution of bundled dependencies.
5. **Source hygiene:** the modified source includes development timing instrumentation (including a hard-coded `C:\Downloads` CSV output path). Review before claiming this is a polished public source release.
6. **Modification notices:** verify dates and clear notices for SSI-modified GPL files.
7. **Source hosting:** corresponding source, instructions and licenses must be accessible alongside any published binaries, in compliance with GPLv3 section 6.

## Release decision

**Do not publish the v1.0.2 binary as a public GitHub Release asset yet.** Continue with source reconciliation, remove or explicitly document development instrumentation, supply a complete build procedure and verify hashes/provenance. Existing private Windows tests are unaffected.

## Sources

- [KiCad licenses](https://www.kicad.org/about/licenses/)
- [GNU GPL version 3, sections 1, 5 and 6](https://www.gnu.org/licenses/gpl-3.0.html)


## Follow-up inspection — 15 October 2026

Direct inspection of the supplied 267 MB source archive shows:

- 18,570 ZIP entries, including a KiCad source tree and a `vcpkg_installed/` directory.
- No embedded `.git/` history, so the upstream commit/tag cannot be established from repository metadata.
- A `vcpkg.json` exists, but no root `CMakeCache.txt` or `build/CMakeCache.txt` was found in the archive. This limits reconstruction of the exact build configuration.
- The modification patch contains live development logging, including `common/gal/cairo/cairo_gal.cpp` writing to `C:/Downloads/SSI_DEV023A4B_Cairo_Groups.csv`.
- A targeted source scan found development instrumentation in `common/gal/cairo/cairo_gal.cpp`, `common/view/view.cpp`, `eeschema/sch_painter.cpp`, and `include/view/view.h`.

**Result:** the supplied sources and patch are not yet a proven clean, reproducible corresponding-source release. Do not remove instrumentation from the tested v1.0.2 binaries without making and testing a new release version. The next step is to obtain a pristine KiCad 10.0.6 baseline and a recorded Windows build manifest (compiler, CMake cache, vcpkg baseline, command lines, build outputs), then compare the modified source and shipped binaries.

No binaries, patcher code, or installer were changed by this audit.
