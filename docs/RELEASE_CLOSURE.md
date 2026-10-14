# Release closure decision — 15 October 2026

**Decision: public binary release remains on HOLD; source inventory and packaging checks have materially advanced.**

## Ready

- Original-vs-modified KiCad 10.0.6 source comparison: 15 substantive changes, 26 newline-only changes, 0 missing upstream paths.
- Clean 15-file patch verified with `git apply --check` against the supplied upstream candidate archive.
- Patcher source retained: `main.go`, `go.mod`; actual EXE reports Go 1.23.2 Windows/amd64, CGO off, trimpath on.
- All 27 embedded replacement binaries match the retained working binary archive byte for byte.
- Original `payload.zip` was located and structurally matched to the appended EXE archive.
- README and features document root-page sheet geometry **display and adjustment**.

## New source kit

`SSI_KiCad_Release_Closure_Source_Kit_001.zip` contains the 15-file patch, Go patcher source, original 27-row binary manifest, 41-path comparison CSV, input archive hashes and a release-gate README. ZIP CRC test passed. It is intentionally small and **not** a full GPL Corresponding Source package.

## Blockers to public binary release

1. Verify the upstream 10.0.6 source archive provenance and applicable third-party license notices.
2. Publish complete Corresponding Source for the actual distributed binaries, including needed dependency sources and build/install-control scripts.
3. Establish a defensible relationship between retained modified source and the 27 built KiCad binaries; a bit-for-bit reproducible rebuild is desirable evidence but not universally a GPL prerequisite.
4. Decide whether to retain documented development instrumentation in the historical v1.0.2 release or produce a new, separately tested clean candidate.
5. Fix the obsolete embedded README in a **new candidate only**, not by silently changing the tested EXE.

**No rebuild or installation was performed.** The original v1.0.2 binary and user installation were not modified.

## Next action

Focus on assembling the full corresponding-source and build-control materials, not generating further redundant audit reports. Publish binaries only after that source package has been checked against GPLv3 section 6 and the project licenses.
