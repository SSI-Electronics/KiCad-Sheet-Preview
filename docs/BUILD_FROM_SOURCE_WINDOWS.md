# Building the modified KiCad 10.0.6 source (Windows x64)

This document captures the **observed build environment** from the retained build evidence. It is not a tested clean-room reproduction of all 27 binaries.

## Source inputs

- Official KiCad 10.0.6 source baseline (verify provenance from the KiCad project).
- SSI's 15-file patch: [SSI_KiCad_10.0.6_CLEAN_15_FILES.patch](../source/patches/SSI_KiCad_10.0.6_CLEAN_15_FILES.patch).
- The full modified source tree is preserved in `SSI_KiCad_Sheet_Preview_v1.0.2_Source_Licenses_002.zip`, within `KiCad_Modified_Source.zip`. 
- The retained `SSI_KiCad_10.0.6_BUILD_AUDIT_001.zip` contains the actual `CMakeCache.txt`, `build.ninja`, `compile_commands.json`, `install_manifest.txt`, `.ninja_log` and vcpkg install log. 

## Observed build environment

| Component | Recorded value |
| --- | --- |
| KiCad | 10.0.6 |
| OS / architecture | Windows x64 |
| Build type | Release |
| Generator | Ninja |
| Compiler | MSVC 14.51.36231, Visual Studio 2026 Community x64 |
| Package manager | vcpkg, x64-windows |
| SWIG | 4.5.1 |
| Go patcher | Go 1.23.2, windows/amd64, CGO disabled |
| Source tree | `C:\KiCad_Development\source\kicad-10.0.6` |
| Build tree | `C:\KiCad_Development\build` |
| Install tree | `C:\KiCad_Development\install` |

Observed CMake options include `KICAD_BUILD_I18N=OFF`, `KICAD_IPC_API=ON`, `KICAD_SCRIPTING_WXPYTHON=ON`, `KICAD_SIGNAL_INTEGRITY=ON`, and `KICAD_USE_PCH=ON`.

## Reconstructed build-control sequence (not executed)

The following is a **template**, not a claim that these were the exact historical command-line arguments. Use the recorded CMake cache and build log for the precise effective configuration.

```powershell
$ErrorActionPreference = 'Stop'
$root = 'C:\KiCad_Development'
$src = Join-Path $root 'source\kicad-10.0.6'
$build = Join-Path $root 'build'
$install = Join-Path $root 'install'

# Apply the SSI patch only to a clean upstream source tree.
# Run git apply --check first. Applying the patch changes the source tree.
git -C $src apply --check 'C:\Downloads\SSI_KiCad_10.0.6_CLEAN_15_FILES.patch'
if ($LASTEXITCODE -ne 0) { throw 'Patch validation failed' }
git -C $src apply 'C:\Downloads\SSI_KiCad_10.0.6_CLEAN_15_FILES.patch'
if ($LASTEXITCODE -ne 0) { throw 'Patch application failed' }

# Configure with the exact dependency/toolchain paths appropriate to this machine.
cmake -S $src -B $build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$install
if ($LASTEXITCODE -ne 0) { throw 'Configure failed' }
cmake --build $build --config Release
if ($LASTEXITCODE -ne 0) { throw 'Build failed' }
cmake --install $build --config Release
if ($LASTEXITCODE -ne 0) { throw 'Install failed' }
```

**Do not run this against an already modified tree.** The actual build relied on vcpkg toolchain paths and additional cache settings not reproduced in this short template. The archive of observed build evidence is necessary for a complete recipe.

## Third-party source and license inventory

The source snapshot includes 164 `vcpkg_installed/vcpkg/blds/` ABI metadata entries, **not** the third-party package source trees. No `downloads/` or `buildtrees/` source trees were found in that snapshot. The vcpkg install log records 107 installed packages. Review the actual 27-binary link/dependency closure and the GPLv3 System Libraries exception to determine which external sources/notices must accompany the binary distribution. Do **not** assume that all 107 packages must be republished or that none are needed.

## Source availability limitations

The observed build evidence does not establish a clean-room rebuild of all 27 binaries. The exact applicable dependency sources and build/install scripts must be assessed for GPLv3 Corresponding Source obligations. No KiCad binaries were rebuilt for this documentation.
