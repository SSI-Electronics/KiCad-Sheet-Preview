# v1.0.2 full source-and-license bundle verification

**Archive:** `SSI_KiCad_Sheet_Preview_v1.0.2_Source_Licenses_001.zip`

**SHA-256:** `fa431552e91a5d9cc74984b0e4c58791af88e2256b8dc20c95526583d9968959`

**Size:** 279,117,127 bytes.

Archive integrity checked: outer ZIP CRC **PASS**. Embedded `KiCad_Modified_Source.zip` CRC **PASS**; 18,570 source-tree entries. Embedded archive SHA-256 `b5edc4c761efe02f907852a35a227eceb81439c548b414276c3c3c003aee1726`.

Verified contents include `LICENSE`, `LICENSE.GPLv3`, `LICENSE.README`, `CMakeLists.txt`, `vcpkg.json`, `eeschema/sch_sheet.cpp`, `common/gal/cairo/cairo_gal.cpp`; source patch; standalone Go patcher source; build notes and install manifest.

**Distribution status:** This is a preserved full modified KiCad source-tree snapshot with notices, but external vcpkg dependency sources and full build/install control have not been confirmed complete. Do not represent the CRC checks as a GPL compliance certification. The standalone Go patcher copyright holder must explicitly approve its license; current bundled README states that no separate license grant has yet been asserted for that source.

No binaries were rebuilt or changed during this verification.

## Updated license bundle (002)

Following explicit owner approval on 15 October 2026, the accompanying source-license notice was corrected to license SSI Electronics' original Go patcher source under GPL-3.0-or-later. The KiCad source archive itself remains byte-identical to version 001.

- Archive: `SSI_KiCad_Sheet_Preview_v1.0.2_Source_Licenses_002.zip`
- SHA-256: `6b4a4cbd5d51345d115353f23f0445d0795a2540aa2c64b6bdae31651e284b9a`
- Size: 279,117,696 bytes
- ZIP integrity: PASS; includes `SHA256SUMS.txt`
- Embedded modified KiCad source ZIP SHA-256: `b5edc4c761efe02f907852a35a227eceb81439c548b414276c3c3c003aee1726` (unchanged)

**Use 002, not 001, for subsequent release preparation.** The bundle is currently a retained local artifact, not a GitHub Release attachment. Dependency source and build-control completeness are still under review; this is not a GPL compliance certification.
