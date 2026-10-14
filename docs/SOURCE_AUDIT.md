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


## BUILD_AUDIT_001 findings — 15 October 2026

The user supplied `SSI_KiCad_10.0.6_BUILD_AUDIT_001.zip`, containing 11 build metadata files. Inspection confirmed:

| Evidence | Finding |
| --- | --- |
| `kicad_build_version.txt` | `10.0.6` |
| `CMakeCache.txt` | `Release`, `Ninja`, MSVC `14.51.36231`, `x64-windows` vcpkg |
| C/C++ compiler | `C:/Program Files/Microsoft Visual Studio/18/Community/VC/Tools/MSVC/14.51.36231/bin/Hostx64/x64/cl.exe` |
| Source root | `C:/KiCad_Development/source/kicad-10.0.6` |
| Install prefix | `C:/KiCad_Development/install` |
| SWIG | `4.5.1` |
| `compile_commands.json` | 2,229 compilation commands; 384 with `eeschema` in source file path |
| `.ninja_log` | 4,515 build log entries |
| `install_manifest.txt` | 829 installed file entries, including all 27 relative paths in the binary payload |
| `vcpkg-manifest-install.log` | dependency manifest resolved successfully; 107 packages in dependency information |

The `PAYLOAD_HASHES.csv` in `SSI_KiCad_10.0.6_WORKING_BINARIES_001.zip` was independently verified: **27/27 entries have matching SHA-256 and byte lengths**. All 27 payload paths are represented in the supplied install manifest.

**Interpretation:** the evidence strongly identifies the build environment and shows consistent binary inventory. It **does not cryptographically prove** that the 27 binaries were built from the exact source archive: the install manifest contains file paths, not output hashes; compiler command listings and Ninja logs likewise do not establish binary-to-source identity.

**Privacy:** the uploaded build metadata contains absolute Windows filesystem paths and potentially local configuration details. Keep the raw audit ZIP private; publish a sanitized reproduction guide instead.

**Remaining release gates:** verify a pristine upstream KiCad 10.0.6 base and patch applicability; record the complete payload embedding/packaging build; obtain reproducible or otherwise independently attested source-to-binary provenance; review third-party licenses and modification notices. The public binary release remains on hold.


## Final EXE payload comparison — 15 October 2026

The released-candidate `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2.exe` was opened directly as a ZIP container. Each of the 27 embedded `payload/bin/` files was hashed with SHA-256 and compared with the matching `bin\\` file from `SSI_KiCad_10.0.6_WORKING_BINARIES_001.zip`:

- 27 files in EXE payload
- 27 files in working binary archive
- 27 matching normalized relative paths
- **27/27 byte-for-byte identical**
- 0 missing and 0 mismatched files

**This proves the shipped patcher embeds the previously audited working binary payload.** It does not prove that those working binaries were built from the exact retained source tree. Public binary release remains on hold pending source correspondence and licensing review.
