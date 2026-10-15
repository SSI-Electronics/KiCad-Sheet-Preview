# One-shot build evidence 006 — source provenance

Captured 15 October 2026 from the user's KiCad development environment. This is a factual provenance record, **not a GPL compliance certification**.

## Exact dependency registries

The modified KiCad source tree contains `vcpkg-configuration.json` with two Git registries pinned to exact baselines:

- Official vcpkg registry: https://github.com/microsoft/vcpkg at `01e159b519b7e791cc5bb3548663a26d9c0922a3`
- KiCad custom registry: https://gitlab.com/kicad/packaging/kicad-vcpkg-registry.git at `9b23c206291914d106d4e9ca486453f676c9b561`
- Custom-registry ports: `python3`, `opencascade`, `wxpython-33`, `wxwidgets-33`, `ngspice`.

These are **registry baselines**, not proof that the actual upstream source tarballs, local patches, or build tools are all preserved. The package versions and overrides are declared in the supplied `vcpkg.json`.

Selected overrides: `glm 0.9.9.8#2`, `python3 3.11.5#0`, `wxwidgets-33 3.3.1#4`, `wxpython-33 4.2.3#6`, `ngspice 46#0`, `protobuf 3.21.12#4`.

## Evidence received

The returned `SSI_KiCad_v1.0.2_ONE_SHOT_Release_Evidence_006(1).zip` contained 23 entries, including `CMakeCache.txt`, `build.ninja`, `compile_commands.json`, `install_manifest.txt`, vcpkg installed-package status, the KiCad `vcpkg.json` and `vcpkg-configuration.json`, and inventories.

Scan summary: the original source, build, install and `vcpkg_installed` directories were present; 133 vcpkg-info files and 1,401 share-manifest files were inventoried. The expected vcpkg download and archive directories were missing at the locations scanned. No source downloads or builds were performed.

## Practical release gate

1. Retrieve the **exact registry trees at the pinned baselines** (including the KiCad custom registry) and preserve applicable portfiles, patches, version metadata and license notices.
2. For the actual 27 modified KiCad payload files, establish the relevant dynamically and statically linked dependency closure from the preserved build evidence; distinguish redistributable source obligations from System Libraries and independent build-only tools.
3. Make the required corresponding sources and scripts available via a GPLv3 section 6-compliant route on equivalent terms to the object-code download. Preserve third-party notices.
4. Only then publish the binary release; do not label the current draft GPL-complete on the strength of inventories alone.

No further local scan is requested. Existing binaries and their SHA-256 values remain unchanged.
