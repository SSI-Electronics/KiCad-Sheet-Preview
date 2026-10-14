# Build and packaging provenance — v1.0.2

**Status: partial reconstruction, not a certified reproducible build.**

This guide describes what has been independently established from the retained build audit, Go source and Windows executable. It does not assert that rebuilding from these inputs produces bit-for-bit identical files.

## KiCad build environment

The retained `BUILD_AUDIT_001` metadata identifies:

- KiCad version: **10.0.6**
- Source tree: `C:/KiCad_Development/source/kicad-10.0.6`
- Build tree: `C:/KiCad_Development/build`
- Install prefix: `C:/KiCad_Development/install`
- CMake generator: **Ninja**
- CMake build type: **Release**
- C/C++ compiler: **Microsoft Visual C++ 14.51.36231** (VS 2026, Hostx64/x64)
- vcpkg triplet: **x64-windows**
- SWIG: **4.5.1**
- Compilation database: 2,229 compile commands
- Installation manifest: 829 entries

The build metadata is retained privately because it contains absolute local paths. It is not appropriate to publish that raw archive without review.

## Patcher source

The Windows patcher source is written in **Go**. The retained source archive contains `main.go` and `go.mod` (module `ssi-kicad-patcher`, Go 1.23 declaration). The code uses Windows APIs directly and checks for a ZIP payload attached to its own executable.

The shipped `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2.exe` is readable as a ZIP archive. Its embedded ZIP includes files under `payload/bin/` and a manifest. The Go source calls `zip.OpenReader` on its executable path and validates payload file hashes before installation.

## Correspondence checks

- The working binary archive contains 27 file entries with validated SHA-256 hashes.
- All 27 binary paths appear in the KiCad installation manifest.
- The patcher EXE contains a readable ZIP payload with matching file structure.
- The source modification patch applies in reverse to all 41 corresponding files in the retained modified source tree.

**Important:** these checks verify inventories and internal consistency. They do not prove the complete build chain or establish that all 27 files were produced from the exact source tree.

## Missing build recipe

A release-quality corresponding-source package still needs:

1. An identified pristine upstream KiCad 10.0.6 tag/commit and an applicable source patch against that baseline.
2. A recorded Windows build procedure with the exact CMake options, dependency versions and required environment.
3. A deterministic or auditable Go packaging recipe that creates the embedded payload ZIP and appends it to the Go executable.
4. The exact original payload manifest and hash-generation method.
5. License notices and modification notices covering KiCad, third-party dependencies and SSI changes.
6. Verification of source-to-binary correspondence (and an explanation of any expected non-reproducible build fields).

**Do not publish a binary release on the strength of this document alone.** It is an evidence record and a guide for completing the release audit.
