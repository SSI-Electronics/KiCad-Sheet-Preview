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

## Provenance limitations

The retained evidence does not itself contain all externally fetched dependency source archives. The fixed registry references below document provenance but do not substitute for applicable Corresponding Source. Existing binaries and their SHA-256 values remain unchanged.

## Public retrieval locations (verified repository identities)

The upstream registry sources are publicly browseable at these fixed revisions:

- [Microsoft vcpkg at baseline](https://github.com/microsoft/vcpkg/tree/01e159b519b7e791cc5bb3548663a26d9c0922a3)
- [KiCad custom registry at baseline](https://gitlab.com/kicad/packaging/kicad-vcpkg-registry/-/tree/9b23c206291914d106d4e9ca486453f676c9b561)

The KiCad manifest directly declares Boost modules, Cairo, wxWidgets 3.3, Curl, HarfBuzz, GLM, OpenCASCADE, OpenGL, Python, OpenSSL, SQLite, ICU, ngspice, wxPython, libgit2, NNG, Protobuf and zstd, with several host tools. **This list is not the final link closure.** In particular, the registry baselines point to version records; vcpkg's per-port `git-tree` records identify the exact portfile revisions. A portfile then identifies the original upstream source and patches. A registry link alone is not the actual corresponding source of a compiled library.

The exact resolved port versions and source references (including transitive libraries) are relevant to evaluating the GPL-required materials. No remote sources were downloaded into the retained local release bundle during this documentation step.
