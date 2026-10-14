# Go patcher packaging audit — v1.0.2

**Scope:** inspection of the retained final `.exe`, its embedded ZIP and the exact `v1.0.2_Source.zip`. This is not a rebuild.

## Source files and dependency declaration

The patcher source archive contains only `main.go` and `go.mod`. The module is `ssi-kicad-patcher` and the Go version declaration is `1.23`. The Go code uses standard-library packages and Windows API calls, without third-party module dependencies in `go.mod`.

## Embedded archive format

The final `SSI_KiCad_Sheet_Preview_Patcher_v1.0.2.exe` opens successfully with a standard ZIP reader. Its embedded ZIP contains **29 entries**: 27 binary files under `payload/bin/`, `manifest.csv`, and one directory entry.

The embedded `manifest.csv` header is:

```csv
RelativePath,OriginalHash,CustomHash
```

The manifest contains 27 data rows. `OriginalHash` identifies the original KiCad binary expected for installation, while `CustomHash` identifies the replacement binary. The Go code reads this manifest from the executable itself via `os.Executable()` and `zip.OpenReader()`, validates safe paths, and uses `payload/` plus the manifest's relative path to locate replacements.

The final EXE SHA-256 is:

```text
3ec87eac31ce0a8759de1d7f4e56d58367005163f11be0c5b3814363b8968cb4
```

The 27 replacement files were previously verified as byte-for-byte identical to the retained working-binaries archive; see `SOURCE_AUDIT.md`.

## What is now established

- The exact embedded archive layout and manifest format are known.
- The patcher reads the archive from its own EXE and does not require a separate payload ZIP at runtime.
- The retained Go source corresponds structurally to this format.
- No Go dependencies outside the standard library are declared.

## What remains unproven

- The exact Go toolchain patch version and compiler/linker flags used to build the shipped executable.
- The original script and ZIP metadata choices used to append the archive to the compiled Go executable.
- A verified rebuild of the standalone Go program with byte-for-byte or explainable binary comparison.
- Correspondence between the 27 compiled KiCad replacements and the retained modified KiCad source tree.

**No installer or binary was rebuilt, modified, or released by this audit.** A reconstructed packaging script would be a new, documented procedure rather than proof of the historical one. Public binary release remains on HOLD pending the broader corresponding-source and licensing review.
