# Retained KiCad build configuration — source correspondence audit

**Status:** configuration recovered from the original build metadata, not yet a verified rebuild.

The archived `SSI_KiCad_10.0.6_BUILD_AUDIT_001.zip` includes `CMakeCache.txt`, `build.ninja`, `compile_commands.json`, `install_manifest.txt` and a vcpkg install log. These are useful build inputs/evidence, but they are **not** a complete standalone build script.

## Verified CMake configuration

| Setting | Value |
| --- | --- |
| Generator | Ninja |
| Build type | Release |
| Install prefix | `C:/KiCad_Development/install` |
| Compiler | MSVC `14.51.36231` Hostx64/x64 |
| Toolchain | `C:/Program Files/Microsoft Visual Studio/18/Community/VC/vcpkg/scripts/buildsystems/vcpkg.cmake` |
| vcpkg triplet | `x64-windows` |
| SWIG | `C:/KiCad_Development/tools/swig/swigwin-4.5.1/swig.exe` |

Selected explicit options recovered from the CMake cache:

```text
-DBUILD_TESTING=ON
-DKICAD_BUILD_I18N=OFF
-DKICAD_BUILD_QA_TESTS=OFF
-DKICAD_IPC_API=ON
-DKICAD_SCRIPTING_WXPYTHON=ON
-DKICAD_SIGNAL_INTEGRITY=ON
-DKICAD_USE_PCH=ON
-DKICAD_USE_SENTRY=OFF
-DKICAD_WIN32_LTCG=OFF
-DKICAD_WIN32_INSTALL_PDBS=OFF
```

These are **observed cache values**, not a claim that each was explicitly passed on the original command line. Additional cached options and dependency versions exist in the private audit archive.

## Distinguish historical packaging experiments from the final patcher

The retained PowerShell scripts `BUILD_KICAD_COMPLETE_003.ps1` and `BUILD_KICAD_EESCHEMA_VERIFIED_004.ps1` build an **NSIS-based KiCad installer**, using the official installed KiCad files and substituting a custom `eeschema.exe`. These scripts are **not** the build recipe for the final standalone Go patcher v1.0.2 and must not be presented as such.

The final patcher embeds 27 replacement binaries and installs/rolls back files in an existing KiCad installation. Its own Go build-and-ZIP-append packaging procedure must be documented independently.

## Remaining evidence to close

1. Recover or reconstruct the original KiCad CMake invocation and dependency lock/versions from available metadata.
2. Confirm that the 15-file source patch plus any extra source additions constitute all modifications used by the compiled payload.
3. Recover the Go packaging recipe, payload manifest generation and source license notices.
4. Rebuild in a controlled environment and compare the produced binaries against the retained 27-file payload, documenting differences if exact hashes do not match.

**No build, source modification or installation was performed in preparing this document.** Public binary release remains on HOLD pending corresponding-source completeness and licensing review.


## Cache-option extraction — follow-up

A read-only extraction of the retained `CMakeCache.txt` found **177 cache entries** with keys beginning `CMAKE_`, `KICAD_`, `VCPKG_`, `BUILD_`, or `SWIG_` (excluding advanced/choice metadata). The output is `SSI_KiCad_CMake_Cache_Audit_003.txt`, SHA-256:

```text
e203d791064fb0cd001bc842e7a373294582db59215c8018ee5e9f9a1dd60b5a
```

Selected entries verified from the source cache:

```text
CMAKE_BUILD_TYPE:STRING=Release
CMAKE_INSTALL_PREFIX:PATH=C:/KiCad_Development/install
CMAKE_GENERATOR:INTERNAL=Ninja
KICAD_BUILD_I18N:BOOL=OFF
KICAD_IPC_API:BOOL=ON
KICAD_SCRIPTING_WXPYTHON:BOOL=ON
KICAD_SIGNAL_INTEGRITY:BOOL=ON
KICAD_USE_PCH:BOOL=ON
VCPKG_TARGET_TRIPLET:STRING=x64-windows
```

The full extracted text includes absolute development machine paths, so it is not committed to this repository. It can be supplied separately for private build reconstruction. **These are observed cache settings, not an authenticated original CMake invocation.** No build or installation was performed.
